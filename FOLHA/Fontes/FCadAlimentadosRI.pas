// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//--------------------------------------------------------------------------------
//Pendência   : SOL 193287 KINTANA 1843529
//Responsável : BRUNO AZEVEDO
//Data        : 05/11/2012
//Descrição   : Ajuste no controle de transação que estava gerando erro.
//--------------------------------------------------------------------------------
//Pendência   : SOL 136934 KINTANA 873383
//Responsável : MARCIO DENILSON
//Data        : 25/01/2011
//Descrição   : Desenvolvimento inicial da tela
//--------------------------------------------------------------------------------

unit FCadAlimentadosRI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, wwdblook,Udatabase, DBCtrls, TREdit, Mask;

type
  TfrmCadAlimentadosRI = class(TfrmCadMestreDetalheCS)
    Label4: TLabel;
    edtNomeFavorecido: TEdit;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    qryNOME: TStringField;
    qryAlimentado: TwwQuery;
    edtPrincipal: TEdit;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    dblkpcmbRubDesconto: TwwDBLookupCombo;
    Label1: TLabel;
    redPercentual: TRealEdit;
    Label3: TLabel;
    dbredistrribui: TDBCheckBox;
    Bevel1: TBevel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    Bevel2: TBevel;
    procedure FormShow(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure qryDetBeforePost(DataSet: TDataSet);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure CmeDetalheDelete(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadAlimentadosRI: TfrmCadAlimentadosRI;

implementation

uses FCadRubricaIndividualInserir;

{$R *.DFM}

procedure TfrmCadAlimentadosRI.FormShow(Sender: TObject);
begin
  inherited;
  redPercentual.value := 0;
  qry.close;
  qry.parambyname('iidPessoa').asInteger := frmCadRubricaIndividualInserir.qrydet.fieldbyname('idpessoa').asInteger;
  qry.open;
  edtNomeFavorecido.text := qry.fieldbyname('NOME').asstring;
  edtPrincipal.Text      := frmCadRubricaIndividualInserir.lbNomeAssistido.Caption;
  qryDet.close;
  qryDet.parambyname('iidfavorecido').asInteger := frmCadRubricaIndividualInserir.qrydet.fieldbyname('idfavorecido').asInteger;
  qryDet.open;
  qryAlimentado.close;
  qryAlimentado.parambyname('IIDTITULAR').asInteger := frmCadRubricaIndividualInserir.qrydet.fieldbyname('IDTITULAR').asInteger;
  qryAlimentado.open;
  MontaSelect.Filtro.Clear;
  Montaselect.Filtro.add(' DEPENTIT.IDTITULAR = '+Inttostr(frmCadRubricaIndividualInserir.qryDet.fieldbyname('idtitular').asInteger));
  Montaselect.Filtro.add(' PESSOA.IDPESSOA = DEPENTIT.IDPESSOA ');
  Montaselect.Filtro.add(' DEPENTIT.IDDEPENDENCIA <> ''PRP''');
  sbtnAlterarClick(self);
 end;

procedure TfrmCadAlimentadosRI.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmCadAlimentadosRI.qryDetBeforePost(DataSet: TDataSet);
begin
  inherited;
  qryDet.fieldbyname('IDTITULAR').asInteger    := frmCadRubricaIndividualInserir.qryDet.fieldbyname('idtitular').asInteger;
  qryDet.fieldbyname('IDFAVORECIDO').asInteger := frmCadRubricaIndividualInserir.qrydet.fieldbyname('idfavorecido').asInteger;
  qrydet.Fieldbyname('PERCENTUAL').asFloat     := redPercentual.Value;
end;

procedure TfrmCadAlimentadosRI.bbtnOkDetClick(Sender: TObject);
begin
  CmeDetalhe.RepetirInsert := False;
  qryDet.ApplyUpdates;
  inherited;
  qryDet.Close;
  qryDet.parambyname('iidfavorecido').asInteger := frmCadRubricaIndividualInserir.qrydet.fieldbyname('idfavorecido').asInteger;
  qryDet.Open;
  bbtnVoltarDetClick(Self);
end;

procedure TfrmCadAlimentadosRI.CmeDetalheDelete(Sender: TObject);
begin
  qryDet.ApplyUpdates;
  inherited;
  CmeDetalhe.Atualizabotoes(Self);
end;

procedure TfrmCadAlimentadosRI.CmeCadastroConfirma(Sender: TObject);
begin
  //BRUNO AZEVEDO SOL 193287 KINTANA 1843529
  //AplicaAlteracoes([qrydet]); //CPREV-26665-23/10/2007
  qrydet.ApplyUpdates;
  //BRUNO AZEVEDO SOL 193287 KINTANA 1843529
end;

procedure TfrmCadAlimentadosRI.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  redPercentual.Text:= FormatFloat('#,##0.00',qrydet.FieldByName('PERCENTUAL').AsFloat);
end;

procedure TfrmCadAlimentadosRI.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  dbredistrribui.checked := false;
  redpercentual.value   := 0;
end;

end.
