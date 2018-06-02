CREATE TABLE #ExecutionPath
(
	[Name] NVARCHAR(500), 
	[Description] NVARCHAR(MAX), 
	[TestingScriptName] NVARCHAR(50), 
	[Parameters] NVARCHAR(MAX), 
	[IsActive] NCHAR(10)
);

INSERT INTO #ExecutionPath (
	[Name],
	[Description], 
	[TestingScriptName], 
	[Parameters], 
	[IsActive])
VALUES 
(
'TestName',
'TestDescription',
'SQL',
'SELECT 
	''Success'' AS [ResultTypeName], 
	''Description text'' AS [Description];',
'Yes'
),
(
'TestName2',
'TestDescription',
'SQL',
'SELECT 
	''Fail'' AS [ResultTypeName], 
	''Description text'' AS [Description];',
'No'
),
(
'TestName3',
'TestDescription',
'SQL',
'SELECT 
	''Info'' AS [ResultTypeName], 
	''Description text'' AS [Description];',
'Yes'
)
;


MERGE 
	[DWTest].[ExecutionPath] AS T 
USING 
	#ExecutionPath AS S
ON [T].[Name] = [S].[Name]

WHEN MATCHED 
	 THEN UPDATE
	 SET	[T].[Description] = [S].[Description], 
			[T].[TestingScriptName] = [S].[TestingScriptName], 
			[T].[Parameters] = [S].[Parameters], 
			[T].[IsActive] = [S].[IsActive]

WHEN NOT MATCHED 
	THEN INSERT 
		([Name],
		[Description], 
		[TestingScriptName], 
		[Parameters], 
		[IsActive])
	VALUES
		([S].[Name],
		[S].[Description], 
		[S].[TestingScriptName], 
		[S].[Parameters], 
		[S].[IsActive]);

DROP TABLE #ExecutionPath;