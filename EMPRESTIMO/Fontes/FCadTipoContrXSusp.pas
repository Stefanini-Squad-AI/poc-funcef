{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FCadTipoContrXSusp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, Wwdatsrc, DBTables, Wwquery,
  fcButton, fcImgBtn, fcShapeBtn, Grids, Wwdbigrd, Wwdbgrid, FSairAjudaImob;

type
  TfrmCadTipoContrXSusp = class(TfrmSairAjudaImob)
    Panel1: TPanel;
    dbcoTipoContrato: TwwDBLookupCombo;
    Label4: TLabel;
    Panel3: TPanel;
    btnIncluir: TfcShapeBtn;
    btnExcluir: TfcShapeBtn;
    qryTipoContrato: TwwQuery;
    qryTipoContratoIDTIPOEMPTMO: TFloatField;
    qryTipoContratoDESCTIPOEMPTMO: TStringField;
    qryTipoContratoIDTIPOCONTREMPTMO: TFloatField;
    qryTipoContratoTCEDESCRICAO: TStringField;
    dsDadosTpContrato: TwwDataSource;
    qryTipoSuspensao: TwwQuery;
    qryAux: TwwQuery;
    dsItens: TwwDataSource;
    qryItens: TwwQuery;
    wwDBGrid1: TwwDBGrid;
    dsTipoSuspensao: TDataSource;
    wwDBGrid2: TwwDBGrid;
    updTipoSuspensao: TUpdateSQL;
    updItens: TUpdateSQL;
    qryTipoSuspensaoIDTIPOSUSPEMPTMO: TFloatField;
    qryTipoSuspensaoTSEDESCRICAO: TStringField;
    qryItensIDTIPOCONTREMPTMO: TFloatField;
    qryItensIDTIPOSUSPEMPTMO: TFloatField;
    qryItensIDTIPOCONTREMPTMO_1: TFloatField;
    qryItensIDTIPOSUSPEMPTMO_1: TFloatField;
    qryItensTCEDESCRICAO: TStringField;
    qryItensTSEDESCRICAO: TStringField;

    procedure FormActivate(Sender: TObject);
    procedure dbcoTipoContratoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);


  private { Private declarations }


  public  { Public declarations }


  end;



var
  frmCadTipoContrXSusp: TfrmCadTipoContrXSusp;



implementation
{$R *.DFM}
uses
  UFuncoesEmptmo, UModulo, USistema;





procedure TfrmCadTipoContrXSusp.FormActivate(Sender: TObject);
begin
  inherited;
   with qryTipoContrato do begin
     LimpaParametros(qryTipoContrato);
     ParamByName('PIDEMPRESAPROP').asInteger := Sistema.IdEmpresa;
     Open;
   end;(* with qryTipoContrato *)
end;



procedure TfrmCadTipoContrXSusp.dbcoTipoContratoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   LimpaParametros(qryTipoSuspensao);
   qryTipoSuspensao.ParamByName('IDTipoContrEmptmo').AsInteger := StrToInt(dbcoTipoContrato.LookupValue);
   qryTipoSuspensao.Open;

   LimpaParametros(qryItens);
   qryItens.ParamByName('PIDTipoContrEmptmo').AsInteger := StrToInt(dbcoTipoContrato.LookupValue);
   qryItens.Open;
end;



procedure TfrmCadTipoContrXSusp.btnIncluirClick(Sender: TObject);
begin
  inherited;
   qryItens.Insert;
   qryItens.FieldByName('IDTIPOCONTREMPTMO').AsInteger := StrToInt(dbcoTipoContrato.LookupValue);
   qryItens.FieldByName('IDTIPOSUSPEMPTMO').AsInteger  := qryTipoSuspensao.FieldByName('IDTIPOSUSPEMPTMO').AsInteger;
   qryItens.Post;
   qryItens.ApplyUpdates;
   qryItens.CommitUpdates;

   qryTipoSuspensao.Close;
   qryTipoSuspensao.Open;
   qryItens.Close;
   qryItens.Open;
end;



procedure TfrmCadTipoContrXSusp.btnExcluirClick(Sender: TObject);
begin
  inherited;
   qryItens.Delete;
   qryItens.ApplyUpdates;
   qryItens.CommitUpdates;

   qryTipoSuspensao.Close;
   qryTipoSuspensao.Open;
   qryItens.Close;
   qryItens.Open;
end;



end.
