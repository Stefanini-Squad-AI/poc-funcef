unit FPRelPAFavor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwdblook, Spin, StdCtrls, Db, DBTables, Wwquery,
  MontaSelect, IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97,
  Buttons, ComCtrls, ExtCtrls, FCMParamRel, usistema, dbasedados;

type
  TfrmPRelPAFavor = class(TCMParamRel)
    TabSheet1: TTabSheet;
    MontaSelectRUBRICAS: TMontaSelect;
    qryPatro: TwwQuery;
    qryPatroNOME: TStringField;
    qryPatroIDPESSOA: TFloatField;
    Panel1: TPanel;
    StaticText3: TStaticText;
    bbtnProcurar: TBitBtn;
    chkRubrica: TCheckBox;
    edRubrica: TEdit;
    pnlInformacoes: TPanel;
    grpMesRef: TGroupBox;
    cmbMes: TComboBox;
    spedAno: TSpinEdit;
    StaticText1: TStaticText;
    dblkpcmbpatrocinadora: TwwDBLookupCombo;
    procedure rbtnVisualizarClick(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    sIdRubrica: string;
    sMesRef: string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPRelPAFavor: TfrmPRelPAFavor;

implementation

uses UMensErro, uAdmPrevFB, UFuncoesFolha, UFuncoesUteisFB, dRelFolha;

{$R *.DFM}

procedure TfrmPRelPAFavor.rbtnVisualizarClick(Sender: TObject);
begin
  inherited;
  dtmBaseDados.dbBaseDados.StartTransaction;
  if not Sistema.GravaLogOperacoes('Emissão: '+caption) then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  // mes atual
  sMesRef := Trim(spedAno.Text)+ '/'+ IntCod(cmbMes.ItemIndex+1,2);

  with dtmRelFolha do
  begin

    qryPAFavor.Close;

    qryPAFavor.SQL.Clear;
    qryPAFavor.SQL.Add(
      'SELECT ' +
      '  H.IDRUBRICA, ' +
      '  P.NOME, ' +
      '  H.VALORPROVENTO, ' +
      '  PF.DATANASC ' +
      'FROM ' +
      '  PESSOA P, ' +
      '  HISTRUBSAL H, ' +
      '  PESSOAFISICA PF ' +
      'WHERE ' +
      '  (H.IDPESSOA = P.IDPESSOA) ' +
      '  AND (H.MESCOBRANCA = '#39+sMesRef+#39') ' +
      '  AND (P.IDPESSOA = PF.IDPESSOA) ');

    if (chkRubrica.Checked) and (edRubrica.Text <> '') then
      qryPAFavor.SQL.Add(
        '  AND (H.IDRUBRICA = '+sIDRubrica+') ');

    if Trim(dblkpcmbpatrocinadora.Text) <> '' then
      qryPAFavor.SQL.Add(
        '  AND (H.IDPATRO = '#39 + qryPatro.FieldByName('IDPESSOA').AsString + #39') ');

  end;

end;

procedure TfrmPRelPAFavor.bbtnProcurarClick(Sender: TObject);
begin
  inherited;

  if chkRubrica.Checked then
  begin
    MontaSelectRUBRICAS.Executar;
  end;

  edRubrica.Text       := '';
  sIdRubrica           := '';

  if (MontaSelectRUBRICAS.ValoresChave.Count > 0) and
     (MontaSelectRUBRICAS.ValoresChave[0] <> '') and (chkRubrica.Checked) then
  begin
    sIdRubrica         := MontaSelectRUBRICAS.ValoresChave[0];
    edRubrica.Text     := MontaSelectRUBRICAS.ValoresChave[1];
  end;

end;

procedure TfrmPRelPAFavor.FormCreate(Sender: TObject);
begin
   inherited;
   TabSheet2.TabVisible:= False;
end;

procedure TfrmPRelPAFavor.FormActivate(Sender: TObject);
var
   wDia,
   wMes,
   wAno : Word;
begin
   inherited;
   DecodeDate(Date, wAno, wMes, wDia);
   cmbMes.ItemIndex := wMes - 1;
   spedAno.Value := wAno;

   qryPatro.Open;
end;

end.
