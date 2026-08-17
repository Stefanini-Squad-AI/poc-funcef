unit uWebRelatorioDinamico;

//Pendência 19090

interface

uses SysUtils, DModAutoAtendimento, uConstPaginasCampos, JCLSysUtils, Classes, Windows,
     FileCtrl, httpapp, uCmClientDataSet, uTypesEmptmoAA, uCtrlFuncoesAA, uCmFileUtils;

function PaginaRelatorioDinamico( iIdWebReports : integer; Request: TWebRequest ): WideString;

implementation

//Monta a página de relatório dinâmico
function PaginaRelatorioDinamico( iIdWebReports : integer; Request: TWebRequest ): WideString;
var
  //Variáveis de geração e emissão de relatórios
  rtDinamico     : TReportType;
  sHTMLFile      : string;
  iIdDataView    ,
  iOrigemCMDV    ,
  iIdReports     ,
  iOrigemCm      : integer;
begin

  try

     //Recupera dados do relatório
     RecuperaConfRelatorio( iIdWebReports,
                            rtDinamico,
                            iIdDataView,
                            iOrigemCMDV,
                            iIdReports,
                            iOrigemCM,
                            sHTMLFile );

      Result := Result +
       '<BR><BR> ' + CR +
       GeraDadosRelatorio( rtDinamico,
                           'frmLnkDinamico',
                           iIdReports,
                           iOrigemCM,
                           sHTMLFile,
                           'Relatório Dinâmico',
                           WebTpReports.RelatorioDinamico( iIdDataView,
                                                           iOrigemCMDV,
                                                           Request ) ) +
       '<center> ' + CR +
       'O relatório será gerado em uma nova página. ' + CR +
       '</center> ' + CR +
       '<script language="JavaScript"> ' + CR +
       '<!-- ' + CR +
       '  document.frmLnkDinamico.submit(); ' + CR +
       '  history.go(-1); ' + CR +
       '//--> ' + CR +
       '</script> ' + CR;
       Result := MontaPagina( 0, Result );
  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end; {PaginaRelatorioDinamico}

end.
