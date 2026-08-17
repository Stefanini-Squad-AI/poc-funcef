{===============================================================================
Unit    :  uVersaoBase
Form    :  frmVersaoBase

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 19/07/2000

Objetivo: Selecionar Versões da Base p/ Trabalhar.

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}
unit uVersaoBase;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, ComCtrls, Grids, Wwdbigrd, Wwdbgrid,
  DBCtrls, Db, DBTables, Wwquery, Wwdatsrc, cmseldlg, wwidlg, TB97Ctls,
  Mask, wwDialog;

type
  TfrmVersaoBase = class(TfrmOkCancelar)
    PageControl: TPageControl;
    TbShVersao: TTabSheet;
    Label2: TLabel;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    srchdlgProcura: TwwSearchDialog;
    seldlgProcuraQry: TcmSelectDlg;
    qryPrincipal: TwwQuery;
    ds: TwwDataSource;
    DBEdit9: TDBEdit;
    Label13: TLabel;
    DBEdit10: TDBEdit;
    Label14: TLabel;
    LkcTbVersao: TwwDBLookupCombo;
    dbnav: TDBNavigator;
    TbShEntid: TTabSheet;
    LkcTbPatroc: TwwDBLookupCombo;
    Label7: TLabel;
    LkcTbEntid: TwwDBLookupCombo;
    Label8: TLabel;
    Label3: TLabel;
    LkcTbPlano: TwwDBLookupCombo;
    Label1: TLabel;
    DbGrdDet: TwwDBGrid;
    DBEdit7: TDBEdit;
    Label11: TLabel;
    DBEdit2: TDBEdit;
    Label9: TLabel;
    qryPrincipalCD_VERSAO: TFloatField;
    qryPrincipalDS_VERSAO: TStringField;
    qryPrincipalDT_GERACAO: TDateTimeField;
    qryPrincipalLOGIN: TStringField;
    qryPrincipalDT_REFER_BASE: TDateTimeField;
    qryPrincipalIR_BASE_HISTORICA: TStringField;
    qryPrincipalCD_PESSOA_PATROC: TFloatField;
    qryPrincipalCD_PESSOA_ENTID: TFloatField;
    qryPrincipalCD_PLANO: TFloatField;
    qryEntidade: TwwQuery;
    qryPatrocinadora: TwwQuery;
    qryPlano: TwwQuery;
    qryEntidadeNO_PESSOA: TStringField;
    qryPatrocinadoraNO_PESSOA: TStringField;
    qryPlanoNO_PLANO: TStringField;
    dsBasePlano: TwwDataSource;
    qryBasePlano: TwwQuery;
    qryBasePlanods_entidade: TStringField;
    qryBasePlanods_patrocinadora: TStringField;
    qryBasePlanods_plano: TStringField;
    qryBasePlanoCD_VERSAO: TFloatField;
    qryBasePlanoCD_PESSOA_PATROC: TFloatField;
    qryBasePlanoCD_PESSOA_ENTID: TFloatField;
    qryBasePlanoCD_PLANO: TFloatField;
    PgCtrlDetalhe: TPageControl;
    tbshDetalhe: TTabSheet;
    wwDBGrid1: TwwDBGrid;
    qryEntidadeCD_PESSOA: TFloatField;
    qryPatrocinadoraCD_PESSOA: TFloatField;
    qryPlanoCD_PLANO: TFloatField;
    QryVersoes: TwwQuery;
    dsVersoes: TwwDataSource;
    QryVersoesCD_VERSAO: TFloatField;
    QryVersoesDS_VERSAO: TStringField;
    QryVersoesDT_GERACAO: TDateTimeField;
    QryVersoesLOGIN: TStringField;
    QryVersoesDT_REFER_BASE: TDateTimeField;
    QryVersoesIR_BASE_HISTORICA: TStringField;
    QryLkpEntidade: TwwQuery;
    StringField1: TStringField;
    FloatField1: TFloatField;
    QryLkpPatrocinadora: TwwQuery;
    StringField2: TStringField;
    FloatField2: TFloatField;
    QryLkpPlano: TwwQuery;
    StringField3: TStringField;
    FloatField3: TFloatField;
    QryLkpVersao: TwwQuery;
    QryLkpVersaoDS_VERSAO: TStringField;
    QryLkpVersaoCD_VERSAO: TFloatField;
    dsLkpVersao: TwwDataSource;
    procedure LkcTbPatrocChange(Sender: TObject);
    procedure LkcTbEntidChange(Sender: TObject);
    procedure LkcTbPlanoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QryLkpVersaoAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVersaoBase: TfrmVersaoBase;

implementation

uses uGlobal, FPrincipal, uSistema;

{$R *.DFM}

procedure TfrmVersaoBase.LkcTbPatrocChange(Sender: TObject);
begin
  if trim(LkcTbPlano.Text) <> '' then
   begin
     LkcTbPlano.OnChange(Sender);
     Exit;
   end;

  if trim(LkcTbPatroc.Text) <> '' then
    LkcTbEntid.Enabled := True
  else
   begin
    LkcTbEntid.Text := '';
    LkcTbEntid.Enabled := False;
    LkcTbPlano.Text := '';
    LkcTbPlano.Enabled := False;
   end;
end;

procedure TfrmVersaoBase.LkcTbEntidChange(Sender: TObject);
begin
  if trim(LkcTbPlano.Text) <> '' then
   begin
     LkcTbPlano.OnChange(Sender);
     Exit;
   end;

  if trim(LkcTbEntid.Text) <> '' then
    LkcTbPlano.Enabled := True
  else
   begin
    LkcTbPlano.Text := '';
    LkcTbPlano.Enabled := False;
   end;

  with QryLkpPlano do
   begin
     Close;
     ParamByName('CD_PESSOA_ENTID').asInteger :=
         QryLkpEntidade.FieldByName('CD_PESSOA').asInteger;
     ParamByName('CD_PESSOA_PATROC').asInteger :=
         QryLkpPatrocinadora.FieldByName('CD_PESSOA').asInteger;
     Open;
   end;
end;

procedure TfrmVersaoBase.LkcTbPlanoChange(Sender: TObject);
begin
  if trim(LkcTbPlano.Text) <> '' then
   begin
    qryVersoes.Close;
    qryVersoes.ParamByName('CD_PESSOA_PATROC').asInteger :=
        QryLkpPatrocinadora.FieldByName('CD_PESSOA').asInteger;
    qryVersoes.ParamByName('CD_PESSOA_ENTID').asInteger :=
        QryLkpEntidade.FieldByName('CD_PESSOA').asInteger;
    qryVersoes.ParamByName('CD_PLANO').asInteger :=
        QryLkpPlano.FieldByName('CD_PLANO').asInteger;
    qryVersoes.Open;
   end
  else
   begin
    qryVersoes.Close;
   end;
end;

procedure TfrmVersaoBase.FormCreate(Sender: TObject);
begin
  inherited;
  QryVersoes.Open;
  QryLkpVersao.Open;
  LkcTbVersao.Text := qryLkpVersao.FieldByName('DS_VERSAO').asString;
  QryPrincipal.Open;
  QryBasePlano.Open;
  QryLkpEntidade.Open;
  QryLkpPatrocinadora.Open;
  QryLkpPlano.Open;
  QryEntidade.Open;
  QryPatrocinadora.Open;
  QryPlano.Open;                                                     

  PageControl.ActivePage := TbShVersao;
end;

procedure TfrmVersaoBase.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryPrincipal.Close;
  QryBasePlano.Close;
  qryVersoes.Close;
  QryLkpEntidade.Close;
  QryLkpPatrocinadora.Close;
  QryLkpPlano.Close;
  qryEntidade.Close;
  qryPatrocinadora.Close;
  qryPlano.Close;
  inherited;
end;

procedure TfrmVersaoBase.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  bbtnSair.Click;
end;

procedure TfrmVersaoBase.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if PageControl.ActivePage = TbShEntid then
   begin
     if trim(LkcTbPlano.Text) = '' then
      begin
        MessageDlg('Selecione a Entidade/Patrocinadora/Plano !',
            mtWarning, [mbOk], 0);
        LkcTbPatroc.SetFocus;
        exit;
      end;

     if (qryVersoes.RecordCount = 0) and (LkcTbPlano.Text <> '') then
      begin
        MessageDlg('Selecione uma Versão da Base de Trabalho !',
            mtWarning, [mbOk], 0);
        LkcTbPatroc.SetFocus;
        exit;
      end;

     uGlobal.WG_CD_VERSAO := QryVersoes.FieldByName('CD_VERSAO').asInteger;
     uGlobal.WG_CD_PESSOA_ENTID := QrylkpEntidade.FieldByName('CD_PESSOA').asInteger;
     uGlobal.WG_CD_PESSOA_PATROC := QryLkpPatrocinadora.FieldByName('CD_PESSOA').asInteger;
     uGlobal.WG_CD_PLANO := QryLkpPlano.FieldByName('CD_PLANO').asInteger;
     uGlobal.WG_DT_REFER_BASE := QryVersoes.FieldByName('DT_REFER_BASE').asDateTime;

     WG_ENTID_PATROC_PLANO :=  qryLkpEntidade.FieldByName('NO_PESSOA').asString + ' / ' +
         qryLkpPatrocinadora.FieldByName('NO_PESSOA').asString + ' / ' +
         qryLkpPlano.FieldByName('NO_PLANO').asString;

     with frmPrincipal.stbarStatusBar do
      begin
        SimplePanel := false;
        panels[0].Text := Sistema.NomeEmpresa;
        panels[1].Text := Sistema.NomeUsuario;
        panels[3].Text := QryVersoes.FieldByName('DS_VERSAO').asString;
        panels[4].Text := qryLkpEntidade.FieldByName('NO_PESSOA').asString;
        panels[5].Text := qryLkpPatrocinadora.FieldByName('NO_PESSOA').asString;
        panels[6].Text := '';
        qryLkpPlano.First;
        while not qryLkpPlano.Eof do
         begin
           if panels[6].Text = '' then
             panels[6].Text := qryLkpPlano.FieldByName('NO_PLANO').asString
           else
             panels[6].Text := panels[6].Text + '; ' + qryLkpPlano.FieldByName('NO_PLANO').asString;

           qryLkpPlano.Next;
         end;
      end;
   end
  else
   begin
     if trim(LkcTbVersao.Text) = '' then
      begin
        MessageDlg('Selecione uma Versão da Base de Trabalho !',
            mtWarning, [mbOk], 0);
        LkcTbVersao.SetFocus;
        exit;
      end;

     uGlobal.WG_CD_VERSAO := QryBasePlano.FieldByName('CD_VERSAO').asInteger;
     uGlobal.WG_CD_PESSOA_ENTID := QryBasePlano.FieldByName('CD_PESSOA_ENTID').asInteger;
     uGlobal.WG_CD_PESSOA_PATROC := QryBasePlano.FieldByName('CD_PESSOA_PATROC').asInteger;
     uGlobal.WG_CD_PLANO := QryBasePlano.FieldByName('CD_PLANO').asInteger;
     uGlobal.WG_DT_REFER_BASE := QryPrincipal.FieldByName('DT_REFER_BASE').asDateTime;

     WG_ENTID_PATROC_PLANO :=  QryBasePlano.FieldByName('DS_ENTIDADE').asString + ' / ' +
         QryBasePlano.FieldByName('DS_PATROCINADORA').asString + ' / ' +
         QryBasePlano.FieldByName('DS_PLANO').asString;

     with frmPrincipal.stbarStatusBar do
      begin
        SimplePanel := false;
        panels[0].Text := Sistema.NomeEmpresa;
        panels[1].Text := Sistema.NomeUsuario;
        panels[3].Text := qryPrincipal.FieldByName('DS_VERSAO').asString;
        panels[4].Text := QryBasePlano.FieldByName('DS_ENTIDADE').asString;
        panels[5].Text := QryBasePlano.FieldByName('DS_PATROCINADORA').asString;
        panels[6].Text := '';
        QryBasePlano.First;
        while not QryBasePlano.Eof do
         begin
           if panels[6].Text = '' then
             panels[6].Text := QryBasePlano.FieldByName('DS_PLANO').asString
           else
             panels[6].Text := panels[6].Text + '; ' + QryBasePlano.FieldByName('DS_PLANO').asString;
             
           QryBasePlano.Next;
         end;  
      end;
   end;
  bbtnCancelar.Click;
end;

procedure TfrmVersaoBase.PageControlChange(Sender: TObject);
begin
  dbnav.Visible := (PageControl.ActivePage = TbShVersao);
end;

procedure TfrmVersaoBase.FormShow(Sender: TObject);
begin
  inherited;
  if WG_CD_VERSAO > 0 then
   begin
     if qryLkpVersao.Locate('CD_VERSAO', WG_CD_VERSAO, [loPartialKey]) then
      begin
        LkcTbVersao.Text := qryLkpVersao.FieldByName('DS_VERSAO').asString;
      end;
   end;
end;

procedure TfrmVersaoBase.QryLkpVersaoAfterScroll(DataSet: TDataSet);
begin
  LkcTbVersao.Text := qryLkpVersao.FieldByName('DS_VERSAO').asString;
end;

end.
