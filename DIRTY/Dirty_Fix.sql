﻿CREATE --ALTERPROC USP_CAU4	@MATK CHAR(12),	@NGAYLAP DATETIME,	@SODU FLOAT,	@TRANGTHAI NVARCHAR(50)ASBEGIN TRAN	BEGIN TRY		IF NOT EXISTS(SELECT *					FROM TAIKHOAN					WHERE MATK = @MATK)		BEGIN			PRINT @MATK +N' KHÔNG TỒN TẠI'			ROLLBACK TRAN			RETURN 1		END		IF @NGAYLAP IS NULL		BEGIN			PRINT N'NGÀY LẬP KHÔNG ĐƯỢC TRỐNG'			ROLLBACK TRAN			RETURN 1		END		IF @SODU <100000		BEGIN			PRINT N'SỐ DƯ KHÔNG HỢP LỆ'			ROLLBACK TRAN			RETURN 1		END		IF @TRANGTHAI NOT IN (N'ĐANG DÙNG',N'ĐÃ KHÓA', N'BỊ HỦY')		BEGIN			PRINT N'TÌNH TRẠNG KHÔNG HỢP LỆ'			ROLLBACK TRAN			RETURN 1		END		UPDATE TAIKHOAN		SET NGAYLAP = @NGAYLAP			,SODU = @SODU			,TINHTRANG = N'ĐANG DÙNG'--@TRANGTHAI		WHERE MATK = @MATK 		--ĐỂ TEST		WAITFOR DELAY '0:0:05'		ROLLBACK TRAN 		RETURN 1		-----	END TRY	BEGIN CATCH		PRINT N'LỖI HỆ THỐNG'		ROLLBACK TRAN		RETURN 1	END CATCHCOMMIT TRANRETURN 0goCREATE --ALTERPROC USP_CAU1	@MATK CHAR(12),	@SODU FLOAT OUTAS--SET TRAN ISOLATION LEVEL READ UNCOMMITTEDBEGIN TRAN	BEGIN TRY		IF NOT EXISTS(SELECT * 					FROM TAIKHOAN 					WHERE MATK = @MATK)		BEGIN			PRINT @MATK + N' KHÔNG TỒN TẠI'			ROLLBACK TRAN			RETURN 		END		IF EXISTS (SELECT * 				FROM TAIKHOAN				WHERE MATK = @MATK AND TINHTRANG = N'ĐÃ KHÓA')		BEGIN			PRINT @MATK + N' ĐÃ BỊ KHÓA'			ROLLBACK TRAN			RETURN 		END		SET @SODU = (SELECT SODU FROM TAIKHOAN WHERE MATK = @MATK)	END TRY	BEGIN CATCH		PRINT N'LỖI HỆ THỐNG'		ROLLBACK TRAN	END CATCHCOMMIT TRANGO