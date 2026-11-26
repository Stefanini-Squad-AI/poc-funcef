// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Hugo Luna
// Data        : 22/10/2007
// Rotina      : CmeCadastroConfirma
// Pendência   : 26665
// Descricao   : Retirando herança e Qry do CmeCadastroConfirma
//
//------------------------------------------------------------------------------

unit FCadAlimentados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, wwdblook,Udatabase, DBCtrls, TREdit, Mask;

type
  TfrmCadAlimentados = class(TfrmCadMestreDetalheCS)
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
  frmCadAlimentados: TfrmCadAlimentados;

implementation

uses FCadRubricaIndiv;

{$R *.DFM}

procedure TfrmCadAlimentados.FormShow(Sender: TObject);
begin
  inherited;
  redPercentual.value := 0;
  qry.close;
  qry.parambyname('iidPessoa').asInteger := frmcadrubricaindiv.qrydet.fieldbyname('idfavorecido').asInteger;
  qry.open;
  edtNomeFavorecido.text := qry.fieldbyname('NOME').asstring;
  edtPrincipal.Text      := frmcadrubricaindiv.dblkpcmbBenef.text;
  qryDet.close;
  qryDet.parambyname('iidfavorecido').asInteger := frmcadrubricaindiv.qrydet.fieldbyname('idfavorecido').asInteger;
  qryDet.open;
  qryAlimentado.close;
  qryAlimentado.parambyname('IIDTITULAR').asInteger := frmcadrubricaindiv.qrydet.fieldbyname('IDTITULAR').asInteger;
  qryAlimentado.open;
  MontaSelect.Filtro.Clear;
  Montaselect.Filtro.add(' DEPENTIT.IDTITULAR = '+Inttostr(frmcadrubricaindiv.qryDet.fieldbyname('idtitular').asInteger));
  Montaselect.Filtro.add(' PESSOA.IDPESSOA = DEPENTIT.IDPESSOA ');
  Montaselect.Filtro.add(' DEPENTIT.IDDEPENDENCIA <> ''PRP''');
  sbtnAlterarClick(self);
 end;

procedure TfrmCadAlimentados.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmCadAlimentados.qryDetBeforePost(DataSet: TDataSet);
begin
  inherited;
  qryDet.fieldbyname('IDTITULAR').asInteger := frmcadrubricaindiv.qryDet.fieldbyname('idtitular').asInteger;
  qryDet.fieldbyname('IDFAVORECIDO').asInteger := frmcadrubricaindiv.qrydet.fieldbyname('idfavorecido').asInteger;
  qrydet.Fieldbyname('PERCENTUAL').asFloat := redPercentual.Value;  
end;

procedure TfrmCadAlimentados.bbtnOkDetClick(Sender: TObject);
begin
  CmeDetalhe.RepetirInsert := False;
  qryDet.ApplyUpdates;
  inherited;
  qryDet.Close;
  qryDet.parambyname('iidfavorecido').asInteger := frmcadrubricaindiv.qrydet.fieldbyname('idfavorecido').asInteger;
  qryDet.Open;
  bbtnVoltarDetClick(Self);
end;

procedure TfrmCadAlimentados.CmeDetalheDelete(Sender: TObject);
begin
  qryDet.ApplyUpdates;
  inherited;
  CmeDetalhe.Atualizabotoes(Self);
end;

procedure TfrmCadAlimentados.CmeCadastroConfirma(Sender: TObject);
begin
  AplicaAlteracoes([qrydet]); //CPREV-26665-23/10/2007
end;

procedure TfrmCadAlimentados.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  redPercentual.Text:= FormatFloat('#,##0.00',qrydet.FieldByName('PERCENTUAL').AsFloat);
end;

procedure TfrmCadAlimentados.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  dbredistrribui.checked := false;
  redpercentual.value   := 0;
end;

end.
