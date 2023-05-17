/*

Data Cleaning

*/

select *
from NashvilleHousing

------------------------------------------------------------------------------------------------------------------------------------------
--Standardize Date Format 

Select SaleDate, convert(Date,SaleDate) 
from NashvilleHousing


Alter table NashvilleHousing
Add SaleDateConverted Date;

Update NashvilleHousing
Set SaleDateConverted = Convert(Date,SaleDate)

select SaleDateConverted
from NashvilleHousing

--------------------------------------------------------------------------------------------------------------------------------------------

--Populate Property Address Data

select PropertyAddress
from NashvilleHousing
Where PropertyAddress is null


Select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.PropertyAddress,b.PropertyAddress)
From NashvilleHousing a Join NashvilleHousing b 
     on a.ParcelID = b.ParcelID
	 AND a.[UniqueID ] <> b.[UniqueID ]
Where a.PropertyAddress is null


Update a
Set PropertyAddress = ISNULL(a.PropertyAddress,b.PropertyAddress)
From NashvilleHousing a Join NashvilleHousing b 
     on a.ParcelID = b.ParcelID
	 AND a.[UniqueID ] <> b.[UniqueID ]
Where a.PropertyAddress is null


----------------------------------------------------------------------------------------------------------------------------------------------------------

--Breaking out Address Into Individual Columns(Address, City, State)

Select PropertyAddress
From NashvilleHousing
--Where PropertyAddress is null
Order by ParcelID

Select
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress)-1) as Address,
SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress)+1, Len(PropertyAddress)) as Address
From NashvilleHousing


Alter table NashvilleHousing
Add PropertySplitAddress Nvarchar(255);

Update NashvilleHousing
Set PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress)-1)


Alter table NashvilleHousing
Add PropertySplitCity Nvarchar(255);

Update NashvilleHousing
Set PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress)+1, Len(PropertyAddress))

Select *
From NashvilleHousing

Select
PARSENAME(Replace(OwnerAddress, ',', '.') ,3), 
PARSENAME(Replace(OwnerAddress, ',', '.') ,2),
PARSENAME(Replace(OwnerAddress, ',', '.') ,1)
FROM NashvilleHousing


Alter table NashvilleHousing
Add OwnerSplitAddress Nvarchar(255);

Update NashvilleHousing
Set OwnerSplitAddress = PARSENAME(Replace(OwnerAddress, ',', '.') ,3)


Alter table NashvilleHousing
Add OwnerSplitCity Nvarchar(255);

Update NashvilleHousing
Set OwnerSplitCity = PARSENAME(Replace(OwnerAddress, ',', '.') ,2)


Alter table NashvilleHousing
Add OwnerSplitState Nvarchar(255);

Update NashvilleHousing
Set OwnerSplitState = PARSENAME(Replace(OwnerAddress, ',', '.') ,1)

-------------------------------------------------------------------------------------------------------------------------------------------------------------

--Change Y and N to Yes and No in "Sold as Vacant" Field


Select Distinct(SoldAsVacant), Count(SoldAsVacant)
From NashvilleHousing
Group by SoldAsVacant
Order by 2


Select SoldAsVacant,
Case When SoldAsVacant = 'Y' THEN 'Yes'
     When SoldAsVacant = 'N' THEN 'No'
	 Else SoldAsVacant
	 End
From NashvilleHousing


Update NashvilleHousing
Set SoldAsVacant = Case When SoldAsVacant = 'Y' THEN 'Yes'
     When SoldAsVacant = 'N' THEN 'No'
	 Else SoldAsVacant
	 End

---------------------------------------------------------------------------------------------------------------------------------------------------------

--Remove Duplicates

With RowNUMCTE AS(
Select *,
   Row_Number() Over(
   Partition by ParcelID,
                PropertyAddress,
				SalePrice,
				SaleDate,
				LegalReference
				Order by
				     UniqueID
					 ) row_num

From NashvilleHousing
--Order by ParcelID
)
Delete
From RowNUMCTE
Where row_num > 1

With RowNUMCTE AS(
Select *,
   Row_Number() Over(
   Partition by ParcelID,
                PropertyAddress,
				SalePrice,
				SaleDate,
				LegalReference
				Order by
				     UniqueID
					 ) row_num

From NashvilleHousing
--Order by ParcelID
)
Select *
From RowNUMCTE
Where row_num > 1

-------------------------------------------------------------------------------------------------------------------------------------------------------------

--Delete  Unused Column

Alter Table NashvilleHousing
Drop Column OwnerAddress, PropertyAddress, TaxDistrict

Select *
From NashvilleHousing