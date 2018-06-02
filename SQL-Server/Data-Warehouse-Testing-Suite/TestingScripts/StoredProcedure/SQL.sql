CREATE PROCEDURE [DWTest].[SQL]
	@ExecutionPathName NVARCHAR(MAX),
	@Batch DATETIME2
AS
	DECLARE @StartTime DATETIME2;
	DECLARE @EndTime DATETIME2;
	DECLARE @ResultTypeName NVARCHAR(MAX);
	DECLARE @Description NVARCHAR(MAX);
	DECLARE @SQL AS NVARCHAR(MAX);
	DECLARE @Result TABLE ([ResultTypeName] NVARCHAR(MAX), [Description] NVARCHAR(MAX));

	SELECT 
		@SQL = [Parameters]
	FROM 
		[DWTest].[ExecutionPath]
	WHERE 
		[Name] = @ExecutionPathName;

	SET @StartTime = SYSDATETIME();
	INSERT @Result EXEC sp_executesql @SQL;
	SET @EndTime = SYSDATETIME();

	SELECT 
		@ResultTypeName = [ResultTypeName],
		@Description = [Description]
	FROM 
		@Result;

	EXEC [DWTest].[InsertIntoResult] 
		@ExecutionPathName,
		@StartTime,
		@EndTime,
		@ResultTypeName,
		@Description,
		@Batch;
RETURN 0
