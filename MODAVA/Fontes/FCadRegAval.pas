unit FCadRegAval;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls,
  Mask, DBCtrls, Wwtable, CMProcura, wwdbdatetimepicker, CMDateTimePicker,
  wwdblook, CmEventosCadastro, ImgList;

type
  TfrmCadRegAval = class(TfrmCadMestreDetalheCS)
    Label1: TLabel;
    dbedMatricula: TDBEdit;
    Label10: TLabel;
    dbedNome: TDBEdit;
    tbshObserv: TTabSheet;
    dbmemComent: TDBMemo;
    MontaSelectFunc: TMontaSelect;
    qryHstAval: TwwQuery;
    dbedSit: TDBEdit;
    dbedCargo: TDBEdit;
    qryUltSeq: TwwQuery;
    updHstAva: TUpdateSQL;
    qryTipAval: TwwQuery;
    Label2: TLabel;
    dblcTipoEntr: TwwDBLookupCombo;
    Label5: TLabel;
    dbedAvaliacao: TDBEdit;
    Label3: TLabel;
    dbedDatPlan: TCMDateTimePicker;
    Label4: TLabel;
    dbedDatReal: TCMDateTimePicker;
    Label8: TLabel;
    dbedAvaliador: TDBEdit;
    Label9: TLabel;
    dbmObser: TDBMemo;
    bbtnBuscaEmpregado: TBitBtn;
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeDetalheConfirma(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qryHstAvalAfterInsert(DataSet: TDataSet);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure qryHstAvalBeforePost(DataSet: TDataSet);
    procedure bbtnBuscaEmpregadoClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadRegAval: TfrmCadRegAval;
  ProxSeq : Integer;

implementation

uses USistema, UMensErro, UDataBase, UsoGeralRH;

{$R *.DFM}

procedure TfrmCadRegAval.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '')  then
  begin
     qryHstAval.Close;
     qryHstAval.ParamByName('IdPessoa').AsInteger    := StrToInt(MontaSelect.ValoresChave[0]);
     qryHstAval.Open;
     qry.Close;
     qry.ParamByName('IdPessoa').AsInteger    := StrToInt(MontaSelect.ValoresChave[0]);
     qry.Open;
  end;
end;

procedure TfrmCadRegAval.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
// A ver
end;

procedure TfrmCadRegAval.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
// A ver
end;

procedure TfrmCadRegAval.CmeCadastroConfirma(Sender: TObject);
begin
   inherited;
   try
      AplicaAlteracoes([qryHstAval]);
   except
      raise;
   end;
   
end; // CmeCadastro.Confirma(Self)

procedure TfrmCadRegAval.CmeDetalheConfirma(Sender: TObject);
begin
   inherited;

end; // CmeDetalhe.Confirma(Self)


procedure TfrmCadRegAval.FormCreate(Sender: TObject);
begin
  inherited;
  qryTipAval.Open;

  qry.Close;
  qry.ParamByName('IdPessoa').AsInteger  := 0;
  qry.Open;

  qryHstAval.Close;
  qryHstAval.ParamByName('IdPessoa').AsInteger  := 0;
  qryHstAval.Open;

  if sUsuXccusto <> '' then
     MontaSelectFunc.Filtro.Add('FUNCIONARIO.CODCENTROCUSTO IN ' + sUsuXccusto);

  if sUsuXfilial <> '' then
     MontaSelectFunc.Filtro.Add('FUNCIONARIO.IDESTAB IN ' + sUsuXfilial);

  MontaSelect := MontaSelectFunc;


end;

procedure TfrmCadRegAval.qryHstAvalAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qryHstAval.FieldByName('IdPessoa').AsInteger := qry.FieldByName('IdPessoa').AsInteger;
  qryHstAval.FieldByName('Avaliador').asString := Sistema.NomeUsuario;
end;

procedure TfrmCadRegAval.bbtnOkDetClick(Sender: TObject);
var
  ProxSeq : Integer;
begin
  if  dsDet.Dataset.State = dsInsert  then begin
      qryUltSeq.Close;
      qryUltSeq.ParamByName('IDPESSOA').AsInteger := qryHstAval.FieldByName('IDPESSOA').AsInteger;
      qryUltSeq.ParamByName('CODTIPOAVAL').AsInteger  := qryTipAval.FieldByName('CODTIPOAVAL').AsInteger;
      qryUltSeq.Open;
      ProxSeq := qryUltSeq.FieldByName('ULTSEQ').AsInteger + 1;
      qryHstAval.FieldByName('NUMSEQ').Value := ProxSeq;
  end;
  inherited;

end;

procedure TfrmCadRegAval.qryHstAvalBeforePost(DataSet: TDataSet);
begin
  inherited;
  qryHstAval.FieldByName('DESCRTIPOAVAL').AsString :=
              qryTipAval.FieldByName('DESCRTIPOAVAL').AsString;
end;

procedure TfrmCadRegAval.bbtnBuscaEmpregadoClick(Sender: TObject);
begin
  inherited;
  MontaSelectFunc.Executar;
  if (MontaSelectFunc.ValoresChave.Count > 0) and (MontaSelectFunc.ValoresChave[0] <> '') then
     dbedAvaliador.Text := MontaSelectFunc.ValoresChave[1];
end;

end.
