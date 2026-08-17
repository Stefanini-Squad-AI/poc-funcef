unit FConsultaAltTabMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Db, DBClient,
  uCMClientDataSet, uCmSqlParams, wwdblook, uCtrlContratos;

type
  TfrmConsultaAltTabMT = class(TfrmSairAjuda)
    pnlTopo: TPanel;
    Label1: TLabel;
    dbgContaDe: TwwDBGrid;
    cds: TCMClientDataSet;
    ds: TDataSource;
    sp: TCMSqlParams;
    dblcContrato: TwwDBLookupCombo;
    cdsContratos: TCMClientDataSet;
    spTeste: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure dblcContratoChange(Sender: TObject);
  private
    { Private declarations }
    CtrlContratos : TCtrlContratos;
  public
    { Public declarations }
  end;

var
  frmConsultaAltTabMT: TfrmConsultaAltTabMT;

implementation

{$R *.DFM}

uses dBaseDados, uSistema, uMensErro;

procedure TfrmConsultaAltTabMT.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlContratos:=TCtrlContratos.Create(Sistema.IdEmpresa, Sistema.IdUsuario);
   CtrlContratos.Initialize(dtmBaseDados.dbBaseDados,True);
   cdsContratos.Data:=CtrlContratos.ListContratos(0);
   sp.Open;
end;

procedure TfrmConsultaAltTabMT.dblcContratoChange(Sender: TObject);
begin
   inherited;
   if (Trim(dblcContrato.LookupValue)='') then Exit; 
   cds.Close;
   sp.SQL.Clear;
   sp.SQL.Add(' SELECT ');
   sp.SQL.Add('    L.ARQUIVO, ');
   sp.SQL.Add('    DECODE(L.OPERACAO,''I'',''Inclusão'',''A'',''Alteração'',''D'',''Exclusão'') AS OPERACAO, ');
   sp.SQL.Add('    L.NOMECAMPO, ');
   sp.SQL.Add('    L.VALORATUAL, ');
   sp.SQL.Add('    L.VALORANTERIOR, ');
   sp.SQL.Add('    L.USUARIO, ');
   sp.SQL.Add('    L.DATAHORA, ');
   sp.SQL.Add('    L.CHAVEPRIMARIA ');
   sp.SQL.Add(' FROM ');
   sp.SQL.Add('    LOGTABELAS L ');
   sp.SQL.Add(' WHERE ');
   sp.SQL.Add('    (UPPER(L.CHAVEPRIMARIA) LIKE ''%IDCONTRATO:'+Trim(dblcContrato.LookupValue)+'%'') AND ');
   sp.SQL.Add('    (L.ARQUIVO  IN (''CONTRATOORIG'',''CONTRATOCONTR'',''OBJXITORIG'','+
                                  '''CONTRATOUSUARIO'',''ADITAMENTO'',''RATEIOCCORIG'','+
                                  '''EMPENHO'',''OBJETOSXITEMCONTR'',''MEDICAO'','+
                                  '''IMPOSTOXOBJETO'',''ATIVIDADESPROJETO'','+
                                  '''IMAGENSCONTRATO'')) ');
   sp.SQL.Add('UNION ALL ');
   sp.SQL.Add(' SELECT ');
   sp.SQL.Add('    L.ARQUIVO, ');   
   sp.SQL.Add('    DECODE(L.OPERACAO,''I'',''Inclusão'',''A'',''Alteração'',''D'',''Exclusão'') AS OPERACAO, ');
   sp.SQL.Add('    L.NOMECAMPO, ');
   sp.SQL.Add('    L.VALORATUAL, ');
   sp.SQL.Add('    L.VALORANTERIOR, ');
   sp.SQL.Add('    L.USUARIO, ');
   sp.SQL.Add('    L.DATAHORA, ');
   sp.SQL.Add('    L.CHAVEPRIMARIA ');
   sp.SQL.Add(' FROM ');
   sp.SQL.Add('    LOGTABELASINDX L ');
   sp.SQL.Add(' WHERE ');
   sp.SQL.Add('    (UPPER(L.CHAVEPRIMARIA) LIKE ''%IDCONTRATO:'+Trim(dblcContrato.LookupValue)+'%'') AND ');
   sp.SQL.Add('    (L.ARQUIVO  IN (''CONTRATOORIG'',''CONTRATOCONTR'',''OBJXITORIG'','+
                                  '''CONTRATOUSUARIO'',''ADITAMENTO'',''RATEIOCCORIG'','+
                                  '''EMPENHO'',''OBJETOSXITEMCONTR'',''MEDICAO'','+
                                  '''IMPOSTOXOBJETO'',''ATIVIDADESPROJETO'','+
                                  '''IMAGENSCONTRATO'')) ');
   sp.SQL.Add('ORDER BY ARQUIVO, DATAHORA DESC ');
   sp.Open;
end;

end.
