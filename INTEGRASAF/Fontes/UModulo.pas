unit UModulo;

interface

Uses Dialogs, SysUtils, Forms;

type TModulo = Class
   private
      FExisteParam :Boolean;
      FDirArquivo :String;
      FDirLog :String;
      FIntOper :LongInt;
      FCodtipDocp :LongInt;
      FCodTipDocR :LongInt;
      FComplDocumento :String;
      fFechaLog :Boolean;
      FIdTipoCliente :LongInt;
      FIdRamoForn :LongInt;
      Function GetComplDocumento:String;
   public

     Property ExisteParam :Boolean Read FExisteParam;
     Property FechaLog :Boolean Read fFechaLog Write fFechaLog;
     Property DirArquivo :String Read FDirArquivo;
     Property DirLog :String Read FDirLog;
     Property IntOper :Integer Read FIntOper;
     Property CodtipDocp :LongInt Read FCodtipDocp;
     Property CodTipDocR :LongInt Read FCodTipDocR;
     Property ComplDocumento :String Read GetComplDocumento;
     Property IdTipoCliente :LongInt Read FIdTipoCliente;
     Property IdRamoForn :LongInt Read FIdRamoForn;

     Procedure BuscaParam;
     Procedure GravaLog(Msg:String);
   end;

var Modulo : TModulo;

implementation

Uses
  uSistema, DIntegraSaf, uMensErro, FLog, FPrincipal, fTelaAut;

Procedure TModulo.BuscaParam;
Begin
  With DtmIntegraSaf, DtmIntegraSaf.QryParam Do
  Begin
    If Active Then Close;
    Params[0].AsFloat := Sistema.Idempresa;
    Open;

    FExisteParam := Not IsEmpty;

    If FExisteParam Then
    Begin
       FDirArquivo := QryParamDIRARQUIVO.AsString;
       FDirLog := QryParamDIRLOG.AsString;
       FIntOper := QryParamINTOPER.AsInteger;
       FCodtipDocp := QryParamCODTIPDOCP.AsInteger;
       FCodTipDocR := QryParamCODTIPDOCR.AsInteger;
       FComplDocumento := QryParamCOMPLDOCUMENTO.AsString;
       FIdTipoCliente := QryParamIDTIPOCLIENTE.AsInteger;
       FIdRamoForn := QryParamIDRAMOFORNECEDOR.AsInteger;
       AbrirForm(FrmLog,TFrmLog,False);
       GravaLog('Atualizando Parâmetros do Sistema');
       FrmPrincipal.Tmr.Interval := FIntOper * 60000;
       //FrmPrincipal.Tmr.Enabled := True;
    End
    Else
    Begin
       FDirArquivo := '';
       FDirLog := '';
       FIntOper := 0;
       FCodtipDocp := 0;
       FCodTipDocR := 0;
       FComplDocumento := '';
       FrmPrincipal.Tmr.Enabled := False;
       FIdTipoCliente := 0;
       FIdRamoForn := 0;
       MsgDlg('Favor Cadastrar Parâmetros do Sistema.','Atenção',mtError,[mbOk],0)
    End;
  End;
End;

Procedure TModulo.GravaLog(Msg:String);
Begin
  If FrmLog <> nil Then
  Begin
     If (FrmLog.ReLog.Lines.Count = 0) And
        (FileExists(FDirLog + 'IntegraSaf.Log')) Then
        FrmLog.ReLog.Lines.LoadFromFile(FDirLog + 'IntegraSaf.Log');
     FrmLog.ReLog.Lines.Add(DateTimeToStr(Now) + ' - ' + Msg);
     FrmLog.ReLog.Lines.SaveToFile(FDirLog + 'IntegraSaf.Log');
  End;
End;


Function TModulo.GetComplDocumento:String;
Begin
  If Trim(FComplDocumento) = '' Then
     Result := 'SAF'
  Else
     Result := FComplDocumento;
End;

end.
