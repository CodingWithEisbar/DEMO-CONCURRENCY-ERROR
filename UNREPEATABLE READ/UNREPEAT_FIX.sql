﻿CREATE --ALTERPROC USP_CAU1	@MATK CHAR(12),	@SODU FLOAT OUTASSET TRAN ISOLATION LEVEL REPEATABLE READBEGIN TRAN	BEGIN TRY		IF NOT EXISTS(SELECT * 					FROM TAIKHOAN 					WHERE MATK = @MATK)		BEGIN			PRINT @MATK + N' KHÔNG TỒN TẠI'			ROLLBACK TRAN			RETURN 		END		IF EXISTS (SELECT * 				FROM TAIKHOAN				WHERE MATK = @MATK AND TINHTRANG = N'ĐÃ KHÓA')		BEGIN			PRINT @MATK + N' ĐÃ BỊ KHÓA'			ROLLBACK TRAN			RETURN 		END		--ĐỂ TEST		WAITFOR DELAY '0:0:05'		---------		SET @SODU = (SELECT SODU FROM TAIKHOAN WHERE MATK = @MATK)	END TRY	BEGIN CATCH		PRINT N'LỖI HỆ THỐNG'		ROLLBACK TRAN	END CATCHCOMMIT TRANGOCREATE --ALTERPROC USP_CAU3	@MATK CHAR(12)ASBEGIN TRAN	BEGIN TRY		IF NOT EXISTS (SELECT *						FROM TAIKHOAN						WHERE MATK = @MATK)		BEGIN			PRINT  @MATK + N' KHÔNG TỒN TẠI'			ROLLBACK TRAN			RETURN 1		END		IF EXISTS (SELECT *				FROM GIAODICH				WHERE MATK = @MATK)		BEGIN			PRINT  @MATK + N' ĐÃ THỰC HIỆN GIAO DỊCH, KHÔNG XÓA ĐƯỢC'			ROLLBACK TRAN			RETURN 1		END		DELETE TAIKHOAN		WHERE MATK = @MATK	END TRY	BEGIN CATCH		PRINT N'LỖI HỆ THỐNG'		ROLLBACK TRAN		RETURN 1	END CATCHCOMMIT TRANRETURN 0