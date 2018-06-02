CREATE PROCEDURE [DWTest].[InsertIntoResult] 
	@ExecutionPathName NVARCHAR(MAX), 
	@StartTime DATETIME2, 
	@EndTime DATETIME2, 
	@ResultTypeName NVARCHAR(MAX),
	@Description NVARCHAR(MAX), 
	@Batch DATETIME2 
AS
	INSERT INTO [DWTest].[Result] (
		[ExecutionPathId], 
		[StartTime], 
		[EndTime], 
		[ResultTypeId],
		[Description], 
		[Batch])
	VALUES (
		[DWTest].[GetExecutionPathId](@ExecutionPathName),
		@StartTime,
		@EndTime,
		[DWTest].[GetResultTypeId](@ResultTypeName),
		@Description,
		@Batch);

RETURN 0


--