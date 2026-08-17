unit dReports;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppCtrls, ppPrnabl, ppClass, ppBands, ppCache, ppDB, ppDBBDE, Db,
  Wwdatsrc, DBTables, wwQuery, ppComm, ppProd, ppReport, uSistema, ppVar,
  ppRelatv, ppDBPipe, uCMTypes;

type
  TdtmReports = class(TForm)
    pplExemplo: TppBDEPipeline;
    dsExemplo: TwwDataSource;
    qryExemplo: TwwQuery;
    rpExemplo: TppReport;
    HeaderBand1: TppHeaderBand;
    Label11: TppLabel;
    Line1: TppLine;
    LblEmpresa: TppLabel;
    DetailBand1: TppDetailBand;
    FooterBand1: TppFooterBand;
    Line2: TppLine;
    LblSistema: TppLabel;
    Calc2: TppSystemVariable;
    Calc1: TppSystemVariable;
    procedure LblEmpresaPrint(Sender: TObject);
    procedure LblSistemaPrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function MostraParam(Form: string): boolean; virtual; abstract;
  end;

var
  dtmReports: TdtmReports;

implementation

Uses fMostraRelat;

{$R *.DFM}

// Utilize os Reports de Exemplo como Base para os seus relatorios
//
//
// Exemplo de implementação do método MostraParam
//======================================================
// Este Método deve ser implementado do DataModulo filho
{
function TdtmRepPadroes.MostraParam(Form: string): boolean;
var frm : TForm;
begin
     if (Trim(Form) = '') then
     Begin
        Result := True;
        Exit;
     End;

     if (AnsiUpperCase(Form) = 'FRMPARAMMODULO') then
        frm := TfrmParamModulo.Create(Application)
     else (AnsiUpperCase(Form) = 'FRMPARAMEXEMPLO') then
        frm := TfrmParamExemplo.Create(Application)
     else
         frm := nil;

     if frm = nil then
        Result := false
     else
     begin
          with frm do
          begin
               Result := (ShowModal = mrOk);
               free;
          end;
     end;
end;
}
procedure TdtmReports.LblEmpresaPrint(Sender: TObject);
begin
  //Impressão do Nome da Empresa No Cabeçalho do Relatório
  If (Sender is TppLabel) Then
  Begin
     If Application.FindComponent('frmMostraRelat') <> nil Then
     Begin
       Case frmMostraRelat.TipoNomeEmpresa of
         tnRazaoSocial  : (Sender as TppLabel).Caption := Sistema.RazaoSocial;
         tnNomeFantasia : (Sender as TppLabel).Caption := Sistema.NomeFantasia;
       Else
         (Sender as TppLabel).Caption := Sistema.NomeEmpresa;
       End;

       frmMostraRelat.TipoNomeEmpresa := tnNomeEmpresa;
     End
     Else
        (Sender as TppLabel).Caption := Sistema.NomeEmpresa;
  End;
end;

procedure TdtmReports.LblSistemaPrint(Sender: TObject);
begin
  //Impressão do Nome do Módulo + Versão no Rodapé do Relatório
  If (Sender is TppLabel) Then
  Begin
     (Sender as TppLabel).Caption := Sistema.NomeModulo + ' - ' + Sistema.Versao;
     If Application.FindComponent('frmMostraRelat') <> nil Then
        (Sender as TppLabel).Caption := (Sender as TppLabel).Caption + ' - Rpt Nº ' +
                                        frmMostraRelat.SQLReport.Params[0].AsString + '/' +
                                        frmMostraRelat.SQLReport.Params[1].AsString;
  End;
end;

end.
