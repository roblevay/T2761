DECLARE @var1 INT=10--Batch 1
GO
DECLARE @var1 INT=20
SELECT @var1--Batch 2
GO
SELECT @var1--Funkar inte, utanför batchen!