{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Padrões de Desenvolvimento }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - TCmCtrlRptAssistencial: Objeto de controle de relatórios  }
{   herdados do FCmReport                               }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 05/01/2001                             }
{                                                       }
{*******************************************************}

unit uCmCtrlRptAssistencial;

                            
interface

Uses Classes, SysUtils, uCmControlObject, Forms, FCmReport, uCmRptManager,
     uMensErro, cmParamReport, uSistema, uCmCtrlReports;


Type

   TCmCtrlRptAssistencial = Class(TCmCtrlReports)
   private

   protected
    function PrintReport: Boolean; Override;

   public
    function ReportExists: Boolean; Override;
   End;

implementation

Uses RParticipantes, RPartCancel, RBeneficiarios, RGrauDep, RDTotalCalc, RResFinan,
     RProduto, RPlanos, RMensPag, RQtBenef, RDepMaior, RInadimp, RVlReceb, RDCalcContr, RCancelados,
     RFatura, RAltCap, RBenSeg, RBenSegCancel, RTabCap, RVlCalc, RBoletos, RQtPart, RTotalCalc,
     RTotalEnvio, RVlEnvio;

{ TCmRptManager }

function TCmCtrlRptAssistencial.PrintReport: Boolean;
Var
  sMensagem :String;
begin
   {
    De acordo com a propriedade IdReport fazemos a chama a classe do relatório herdado do form CMReport.
    O método de classe PrintReport e seus parâmetros são identicos para todas as chamadas.
   }
   Result := False;

   Case Idreport Of

       98 : Result := TRptVlReceb.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
             IdModulo, Params, FileName, DataBaseName, NomeEmpresa, NomeModulo,
              sMensagem, DbAdoConnection, DbConnectionType, Devicetype,
               ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, {se exibe form de parametros}
                lstHtmlFOrmParam, GeraHtmlFormParam );

     2141 : Result := TRptTabCap.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
             IdModulo, Params, FileName, DataBaseName, NomeEmpresa, NomeModulo,
              sMensagem, DbAdoConnection, DbConnectionType, Devicetype,
               ShowCancelDialog, ShowPrintDialog, ExibeMensagem, False, {não exibe form de parametros}
                lstHtmlFOrmParam, GeraHtmlFormParam );

     3310 : Result := TRptParticipantes.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
             IdModulo, Params, FileName, DataBaseName, NomeEmpresa, NomeModulo,
              sMensagem, DbAdoConnection, DbConnectionType, Devicetype,
               ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, {se exibe form de parametros}
                lstHtmlFOrmParam, GeraHtmlFormParam );

     3312 : Result := TRptBenSeg.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
             IdModulo, Params, FileName, DataBaseName, NomeEmpresa, NomeModulo,
              sMensagem, DbAdoConnection, DbConnectionType, Devicetype,
               ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, {se exibe form de parametros}
                lstHtmlFOrmParam, GeraHtmlFormParam );

     3314 : Result := TRptBenSegCancel.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
             IdModulo, Params, FileName, DataBaseName, NomeEmpresa, NomeModulo,
              sMensagem, DbAdoConnection, DbConnectionType, Devicetype,
               ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, {se exibe form de parametros}
                lstHtmlFOrmParam, GeraHtmlFormParam );

     3315 : Result := TRptFatura.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
             IdModulo, Params, FileName, DataBaseName, NomeEmpresa, NomeModulo,
              sMensagem, DbAdoConnection, DbConnectionType, Devicetype,
               ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, {se exibe form de parametros}
                lstHtmlFOrmParam, GeraHtmlFormParam );

     3317 : Result := TRptAltCap.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
             IdModulo, Params, FileName, DataBaseName, NomeEmpresa, NomeModulo,
              sMensagem, DbAdoConnection, DbConnectionType, Devicetype,
               ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, {se exibe form de parametros}
                lstHtmlFOrmParam, GeraHtmlFormParam );

     3382 : Result := TRptVlCalc.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
             IdModulo, Params, FileName, DataBaseName, NomeEmpresa, NomeModulo,
              sMensagem, DbAdoConnection, DbConnectionType, Devicetype,
               ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, {se exibe form de parametros}
                lstHtmlFOrmParam, GeraHtmlFormParam );

     3396 : Result := TRptPartCancel.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
             IdModulo, Params, FileName, DataBaseName, NomeEmpresa, NomeModulo,
              sMensagem, DbAdoConnection, DbConnectionType, Devicetype,
               ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, {se exibe form de parametros}
                lstHtmlFOrmParam, GeraHtmlFormParam );

     3406 : Result := TRptBoletos.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
             IdModulo, Params, FileName, DataBaseName, NomeEmpresa, NomeModulo,
              sMensagem, DbAdoConnection, DbConnectionType, Devicetype,
               ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, {se exibe form de parametros}
                lstHtmlFOrmParam, GeraHtmlFormParam );

     3410 : Result := TRptQtPart.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
             IdModulo, Params, FileName, DataBaseName, NomeEmpresa, NomeModulo,
              sMensagem, DbAdoConnection, DbConnectionType, Devicetype,
               ShowCancelDialog, ShowPrintDialog, ExibeMensagem, False, {se exibe form de parametros}
                lstHtmlFOrmParam, GeraHtmlFormParam );

     3650 : Result := TRptTotalCalc.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
             IdModulo, Params, FileName, DataBaseName, NomeEmpresa, NomeModulo,
              sMensagem, DbAdoConnection, DbConnectionType, Devicetype,
               ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, {se exibe form de parametros}
                lstHtmlFOrmParam, GeraHtmlFormParam );

     3657 : Result := TRptTotalEnvio.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
             IdModulo, Params, FileName, DataBaseName, NomeEmpresa, NomeModulo,
              sMensagem, DbAdoConnection, DbConnectionType, Devicetype,
               ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, {se exibe form de parametros}
                lstHtmlFOrmParam, GeraHtmlFormParam );

     3660 : Result := TRptVlEnvio.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
             IdModulo, Params, FileName, DataBaseName, NomeEmpresa, NomeModulo,
              sMensagem, DbAdoConnection, DbConnectionType, Devicetype,
               ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, {se exibe form de parametros}
                lstHtmlFOrmParam, GeraHtmlFormParam );
(*
     3739 : Result := TRptLancamentos.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
             IdModulo, Params, FileName, DataBaseName, NomeEmpresa, NomeModulo,
              sMensagem, DbAdoConnection, DbConnectionType, Devicetype,
               ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, {se exibe form de parametros}
                lstHtmlFOrmParam, GeraHtmlFormParam );
*)

   Else
      MessageInfo := 'Relatório não implementado'
   End;

   If Not Result Then  MessageInfo := sMensagem;
end;

function TCmCtrlRptAssistencial.ReportExists: Boolean;
begin
  {
   Retorna a validação dos relatório já implementados
  }

  //P.RAMOS-13.09.2004-PEND.17424
  // relatórios em 2 camadas
//  if (IdReport = 3975) or (IdReport = 3957) or (idReport = 3955) then
//    result := false
//  else
//    Result:=True;
  result:=(idreport =   98) or
          (idreport = 2141) or
          (idreport = 3310) or
          (idreport = 3312) or
          (idreport = 3314) or
          (idreport = 3315) or
          (idreport = 3317) or
          (idreport = 3382) or
          (idreport = 3396) or
          (idreport = 3406) or
          (idreport = 3410) or
          (idreport = 3650) or
          (idreport = 3657) or
          (idreport = 3660);
  //P.RAMOS-13.09.2004-PEND.17424-ATÉ AQUI
  (*
  Result := (IdReport = 2138);
  Result := (IdReport = 3077);
  Result := (IdReport =   96);
  Result := (IdReport = 2139);
  Result := (IdReport = 2137);
  Result := (IdReport = 2130);
  Result := (IdReport =  101);
  Result := (IdReport =   98);
  Result := (IdReport = 2143);
  Result := (IdReport = 2141);
  Result := (IdReport = 2145);
  Result := (IdReport = 2147);
  Result := (IdReport = 2762);
  Result := (IdReport =   78);
  *)
end;

end.
