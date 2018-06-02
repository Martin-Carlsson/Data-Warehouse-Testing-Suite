CREATE TABLE #ResultType
(
	[Name] NVARCHAR(100)
)

INSERT INTO #ResultType (
	[Name])
VALUES 
	('Success'),
	('Fail'),
	('Attention'),
	('Info');

MERGE 
	[DWTest].[ResultType] AS T 
USING 
	#ResultType AS S
ON [T].[Name] = [S].[Name]

WHEN NOT MATCHED THEN
	INSERT 
		([Name])
	VALUES
		([S].[Name]);

DROP TABLE #ResultType;