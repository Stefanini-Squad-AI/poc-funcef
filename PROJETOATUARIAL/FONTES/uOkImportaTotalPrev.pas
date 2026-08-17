unit uOkImportaTotalPrev;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, FTelaAut, Db, DBTables, Wwquery, Wwdatsrc,
  wwdblook, checklst;

type
  TfrmOkImportaTotalPrev = class(TfrmOkCancelar)
    qryPat: TwwQuery;
    wwQryAtuTipoBenef: TwwQuery;
    StringField1: TStringField;
    wwQryAtuPartic: TwwQuery;
    StringField2: TStringField;
    Label10: TLabel;
    qrySitFundacao: TwwQuery;
    wwQryTotalxx: TwwQuery;
    qrySitFundacaoCD_SITUACAO_FUNDACAO: TFloatField;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    GroupBox2: TGroupBox;
    CkLstBxSitFundacao: TCheckListBox;
    QryTotal: TQuery;
    qrySitFundacaoDS_SITUACAO_FUNDACAO: TStringField;
    QryGrupoPatrocinadoras: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure GetPatrocinadoras_Planos;
  private
    { Private declarations }
    lstPatrocinadora, lstPlano: TStringList;
  public
    { Public declarations }
  end;

var
  frmOkImportaTotalPrev: TfrmOkImportaTotalPrev;
  LstCodSituacao: TStringList;

implementation

uses uGlobal, FPrincipal, uVersaoBase, uImportacaoTOTALPREV, FAnimacao,
  dBaseDados;


{$R *.DFM}

procedure TfrmOkImportaTotalPrev.FormCreate(Sender: TObject);
begin
  inherited;

   if uGlobal.WG_CD_VERSAO = 0 then
   begin
     MessageDlg('Selecione uma Versão da Base de Trabalho !',
        mtWarning, [mbOk], 0);
     AbrirForm(frmVersaoBase,TfrmVersaoBase,False );
     close;
   end;

  with frmPrincipal.stbarStatusBar do
     begin
      Edit1.Text := panels[3].Text;  // versao
      Edit2.Text := panels[4].Text;  // entidade
      Edit3.Text := panels[5].Text;  // patroc
      Edit4.Text := panels[6].Text;  // plan
    end;

  qrySitFundacao.close;
  qrySitFundacao.open;

  LstCodSituacao := TStringList.Create;
  repeat
    CkLstBxSitFundacao.Items.Add(qrySitFundacao.FieldByName('DS_SITUACAO_FUNDACAO').asString);
    LstCodSituacao.Add(qrySitFundacao.FieldByName('CD_SITUACAO_FUNDACAO').asString);
    qrySitFundacao.next;
  until qrySitFundacao.EOF;
end;

procedure TfrmOkImportaTotalPrev.bbtnConfirmarClick(Sender: TObject);
var
  i: byte;
  Selecionado: Boolean;
  Situacao, Patrocinadoras, Planos: String;
begin
  Situacao := '';
  Patrocinadoras := '';
  Planos := '';
  Selecionado := false;
  
  for i := 0 to CkLstBxSitFundacao.Items.Count - 1 do
   if CkLstBxSitFundacao.Checked[i] then
     Selecionado := true;

  if not(Selecionado) then
   begin
     MessageDlg('Selecione uma situação para realizar a importação !',
        mtWarning, [mbOk], 0);
     exit;
   end;

  for i := 0 to CkLstBxSitFundacao.Items.Count - 1 do
   if CkLstBxSitFundacao.Checked[i] then
    if Situacao = '' then
      Situacao := LstCodSituacao.Strings[i]
    else
      Situacao := Situacao + ', ' + LstCodSituacao.Strings[i];

   Screen.Cursor := crHourGlass;

  Try
   lstPatrocinadora := TStringList.Create;
   lstPlano := TStringList.Create;

   GetPatrocinadoras_Planos;

   for i := 0 to lstPatrocinadora.Count - 1 do
    begin
      if i = 0 then
        Patrocinadoras := lstPatrocinadora.Strings[i]
      else
        Patrocinadoras := Patrocinadoras + ', ' + lstPatrocinadora.Strings[i];
    end;

   for i := 0 to lstPlano.Count - 1 do
    begin
      if i = 0 then
        Planos := lstPlano.Strings[i]
      else
        Planos := Planos + ', ' + lstPlano.Strings[i];
    end;

   uImportacaoTOTALPREV.InsereParticipante(WG_CD_PESSOA_ENTID, WG_CD_PESSOA_PATROC,
         WG_CD_PLANO, WG_CD_VERSAO, Situacao, Patrocinadoras, Planos, WG_DT_REFER_BASE);

   //-- Atualiza tipo de Participante - Ativo / Assistido
   wwQryAtuTipoBenef.close;
   wwQryAtuTipoBenef.ParamByName('cd_versao').asinteger := WG_CD_VERSAO;
   wwQryAtuTipoBenef.ExecSQL;

   wwQryAtuPartic.close;
   wwQryAtuPartic.ParamByName('cd_versao').asinteger    := WG_CD_VERSAO;
   wwQryAtuPartic.ExecSQL;

   //-------------------
   if not(uImportacaoTOTALPREV.cancelado) then
   if uImportacaoTOTALPREV.falhou then
    begin
     try
       frmAnimacao.Close;
       frmAnimacao.Free;
     except  end;
     MessageDlg('Houve erros na importação!', mtError, [mbOk], 0);
    end
   else
    begin
     MessageDlg('Importação realizada com sucesso.', mtInformation, [mbOk], 0);
    end;
  Finally
   Screen.Cursor := crDefault;
   lstPatrocinadora.Free;
   lstPlano.Free;
   LstCodSituacao.free;
   close;
  End;
end;

procedure TfrmOkImportaTotalPrev.GetPatrocinadoras_Planos;
begin
  QryGrupoPatrocinadoras.Close;
  QryGrupoPatrocinadoras.ParamByName('CD_VERSAO').asInteger := uGlobal.WG_CD_VERSAO;
  QryGrupoPatrocinadoras.Open;

  lstPatrocinadora.Clear;
  lstPlano.Clear;
  lstPatrocinadora.Duplicates := dupIgnore;
  lstPlano.Duplicates := dupIgnore;

  while not QryGrupoPatrocinadoras.Eof do
   begin
     if lstPatrocinadora.IndexOf(QryGrupoPatrocinadoras.FieldByName('CD_PESSOA_PATROC').asString) = -1 then
       lstPatrocinadora.Add(QryGrupoPatrocinadoras.FieldByName('CD_PESSOA_PATROC').asString);

     if lstPlano.IndexOf(QryGrupoPatrocinadoras.FieldByName('CD_PLANO').asString) = -1 then
       lstPlano.Add(QryGrupoPatrocinadoras.FieldByName('CD_PLANO').asString);
       
     QryGrupoPatrocinadoras.Next;
   end;

  lstPatrocinadora.Sort;
  lstPlano.Sort;
end;

end.
