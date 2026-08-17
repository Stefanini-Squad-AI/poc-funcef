 {===============================================================================
Unit    :  uVersaoBaseHist
Form    :  frmVersaoBaseHist

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 19/07/2000

Objetivo: Selecionar Versões da Base de Histórico.

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}
unit uVersaoBaseHist;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, ComCtrls, Grids, Wwdbigrd, Wwdbgrid,
  DBCtrls, Db, DBTables, Wwquery, Wwdatsrc, cmseldlg, wwidlg, TB97Ctls,
  Mask, wwDialog;

type
  TfrmVersaoBaseHist = class(TfrmOkCancelar)
    PageControl: TPageControl;
    TbShVersao: TTabSheet;
    qryPatroc: TwwQuery;
    qryPatrocNO_PESSOA: TStringField;
    qryPatrocCD_PESSOA: TFloatField;
    qryEntid: TwwQuery;
    qryEntidNO_PESSOA: TStringField;
    qryEntidCD_PESSOA: TFloatField;
    qryPlano: TwwQuery;
    qryPlanoNO_PLANO: TStringField;
    qryPlanoCD_PLANO: TFloatField;
    qryVersoes: TwwQuery;
    dsVersoes: TwwDataSource;
    Label2: TLabel;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    srchdlgProcura: TwwSearchDialog;
    seldlgProcuraQry: TcmSelectDlg;
    qryPrincipal: TwwQuery;
    ds: TwwDataSource;
    Label5: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    qryPlan: TwwQuery;
    qryEnt: TwwQuery;
    qryPat: TwwQuery;
    dsPat: TwwDataSource;
    dsEnt: TwwDataSource;
    dsPlan: TwwDataSource;
    qryPatNO_PESSOA: TStringField;
    qryEntNO_PESSOA: TStringField;
    qryPlanNO_PLANO: TStringField;
    DBEdit9: TDBEdit;
    Label13: TLabel;
    DBEdit10: TDBEdit;
    Label14: TLabel;
    LkcTbVersao: TwwDBLookupCombo;
    qryVersao: TwwQuery;
    dsVersao: TwwDataSource;
    qryVersaoCD_VERSAO: TFloatField;
    qryVersaoDS_VERSAO: TStringField;
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
    qryVersoesCD_VERSAO: TFloatField;
    qryVersoesDS_VERSAO: TStringField;
    qryVersoesDT_GERACAO: TDateTimeField;
    qryVersoesLOGIN: TStringField;
    qryVersoesDT_REFER_BASE: TDateTimeField;
    qryVersoesIR_BASE_HISTORICA: TStringField;
    qryVersoesCD_VERSAO_1: TFloatField;
    qryVersoesCD_PESSOA_PATROC: TFloatField;
    qryVersoesCD_PESSOA_ENTID: TFloatField;
    qryVersoesCD_PLANO: TFloatField;
    qryE: TwwQuery;
    qryENO_PESSOA: TStringField;
    qryP: TwwQuery;
    qryPNO_PESSOA: TStringField;
    qryPl: TwwQuery;
    qryPlNO_PLANO: TStringField;
    procedure LkcTbPatrocChange(Sender: TObject);
    procedure LkcTbEntidChange(Sender: TObject);
    procedure LkcTbPlanoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dbnavClick(Sender: TObject; Button: TNavigateBtn);
    procedure LkcTbVersaoChange(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    form: String; // Variável que define qual
                  //o form que será aberto
                  //após a seleção da Versão
  end;

var
  frmVersaoBaseHist: TfrmVersaoBaseHist;

implementation

uses uGlobal, FTelaAut, uParticipanteHist, uMemoriaCalculoHist, FCadVersaoBase,
  uConsultaCalculoAtivoHist, uConsultaCalculoHist;

{$R *.DFM}

procedure TfrmVersaoBaseHist.LkcTbPatrocChange(Sender: TObject);
begin
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

procedure TfrmVersaoBaseHist.LkcTbEntidChange(Sender: TObject);
begin
  if trim(LkcTbEntid.Text) <> '' then
    LkcTbPlano.Enabled := True
  else
   begin
    LkcTbPlano.Text := '';
    LkcTbPlano.Enabled := False;
   end;

  if LkcTbPlano.Enabled then
   begin
    qryPlano.Close;
    qryPlano.ParamByName('CD_PESSOA_PATROC').asInteger :=
      qryPatroc.FieldByName('CD_PESSOA').asInteger;
    qryPlano.ParamByName('CD_PESSOA_ENTID').asInteger :=
      qryEntid.FieldByName('CD_PESSOA').asInteger;
    qryPlano.Open;
   end;   
end;

procedure TfrmVersaoBaseHist.LkcTbPlanoChange(Sender: TObject);
begin
  if trim(LkcTbPlano.Text) <> '' then
   begin
    qryVersoes.Close;
    qryVersoes.ParamByName('CD_PESSOA_PATROC').asInteger :=
                  qryPatroc.FieldByName('CD_PESSOA').asInteger;
    qryVersoes.ParamByName('CD_PESSOA_ENTID').asInteger :=
                  qryEntid.FieldByName('CD_PESSOA').asInteger;
    qryVersoes.ParamByName('CD_PLANO').asInteger :=
                  qryPlano.FieldByName('CD_PLANO').asInteger;
    qryVersoes.Open;
   end
  else
   begin
    qryVersoes.Close;
   end;
end;

procedure TfrmVersaoBaseHist.FormCreate(Sender: TObject);
begin
  inherited;
  qryPatroc.Open;
  qryEntid.Open;
  qryPlano.Open;
  qryVersao.Open;
  qryPat.Open;
  qryEnt.Open;
  qryPlan.Open;

  qryVersao.Next;
  qryVersao.First;

  LkcTbVersao.Text := qryVersao.FieldByName('DS_VERSAO').asString;  
  PageControl.ActivePage := TbShVersao;
end;

procedure TfrmVersaoBaseHist.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryPatroc.Close;
  qryEntid.Close;
  qryPlano.Close;
  qryVersao.Close;
  qryPrincipal.Close;
  qryPat.Close;
  qryEnt.Close;
  qryPlan.Close;
end;

procedure TfrmVersaoBaseHist.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  bbtnSair.Click;
end;

procedure TfrmVersaoBaseHist.bbtnConfirmarClick(Sender: TObject);
var
  CD_VERSAO: Integer;
begin
  inherited;
  if PageControl.ActivePage = TbShEntid then
   begin
    if trim(LkcTbPlano.Text) = '' then
     begin
      ShowMessage('Selecione a Entidade/Patrocinadora/Plano !');
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

      CD_VERSAO := qryVersoes.FieldByName('CD_VERSAO').asInteger;

     qryE.Close;
     qryP.Close;
     qryPl.Close;
     qryE.ParamByName('CD_PESSOA_ENTID').asInteger := qryPrincipal.FieldByName('CD_PESSOA_ENTID').asInteger;
     qryP.ParamByName('CD_PESSOA_PATROC').asInteger := qryPrincipal.FieldByName('CD_PESSOA_PATROC').asInteger;
     qryPl.ParamByName('CD_PLANO').asInteger := qryPrincipal.FieldByName('CD_PLANO').asInteger;
     qryE.Open;
     qryP.Open;
     qryPl.Open;
     WG_ENTID_PATROC_PLANO_HIST :=  qryE.FieldByName('NO_PESSOA').asString + ' / ' +
                                  qryP.FieldByName('NO_PESSOA').asString + ' / ' +
                                  qryPl.FieldByName('NO_PLANO').asString;

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

      CD_VERSAO := qryPrincipal.FieldByName('CD_VERSAO').asInteger;

     qryE.Close;
     qryP.Close;
     qryPl.Close;
     qryE.ParamByName('CD_PESSOA_ENTID').asInteger := qryPrincipal.FieldByName('CD_PESSOA_ENTID').asInteger;
     qryP.ParamByName('CD_PESSOA_PATROC').asInteger := qryPrincipal.FieldByName('CD_PESSOA_PATROC').asInteger;
     qryPl.ParamByName('CD_PLANO').asInteger := qryPrincipal.FieldByName('CD_PLANO').asInteger;
     qryE.Open;
     qryP.Open;
     qryPl.Open;
     WG_ENTID_PATROC_PLANO_HIST :=  qryE.FieldByName('NO_PESSOA').asString + ' / ' +
                                  qryP.FieldByName('NO_PESSOA').asString + ' / ' +
                                  qryPl.FieldByName('NO_PLANO').asString;      

   end;

  if form = 'ParticipanteHist' then
   begin
    AbrirForm(frmParticipanteHist,TfrmParticipanteHist,False );
    frmParticipanteHist.Versao := CD_VERSAO;
   end
  else if form = 'MemoriaCalculoHist' then
   begin
    AbrirForm(frmMemoriaCalculoHist,TfrmMemoriaCalculoHist,False );
    frmMemoriaCalculoHist.Versao := CD_VERSAO;
    frmMemoriaCalculoHist.qryPrincipal.Close;
    frmMemoriaCalculoHist.qryPrincipal.ParamByName('CD_VERSAO').asInteger := CD_VERSAO;
    frmMemoriaCalculoHist.qryPrincipal.Open;
   end
  else if form = 'NovaBase' then
   begin
    AbrirForm(frmCadVersaoBase,TfrmCadVersaoBase,False );
    with frmCadVersaoBase do
     begin
       versao_velha := CD_VERSAO;
       op := 'N';
       bbtnCancelar.Enabled := false;
       bbtnSair.Enabled := false;
       SbtnInserir.Click;
     end;
    Close;
   end
  else if form = 'CalculoAtivosHist' then
   begin
    AbrirForm(frmConsultaCalculoAtivoHist,TfrmConsultaCalculoAtivoHist,False );
    with frmConsultaCalculoAtivoHist do
     begin
      wwqryCalculo.close;
      wwqryCalculo.ParamByName('CD_PESSOA_ENTID').AsInteger :=
                           qryPrincipal.FieldByName('CD_PESSOA_ENTID').asInteger;
      wwqryCalculo.ParamByName('CD_PESSOA_PATROC').AsInteger :=
                           qryPrincipal.FieldByName('CD_PESSOA_PATROC').asInteger;
      wwqryCalculo.ParamByName('CD_PLANO').AsInteger :=
                           qryPrincipal.FieldByName('CD_PLANO').asInteger;
      wwqryCalculo.Open;
     end;
   end
  else if form = 'CalculoHist' then
   begin
    AbrirForm(frmConsultaCalculoHist,TfrmConsultaCalculoHist,False );
    with frmConsultaCalculoHist do
     begin
       wwqryCalculo.close;
       wwqryCalculo.ParamByName('CD_PESSOA_ENTID').AsInteger :=
                           qryPrincipal.FieldByName('CD_PESSOA_ENTID').asInteger;
       wwqryCalculo.ParamByName('CD_PESSOA_PATROC').AsInteger :=
                           qryPrincipal.FieldByName('CD_PESSOA_PATROC').asInteger;
       wwqryCalculo.ParamByName('CD_PLANO').AsInteger :=
                           qryPrincipal.FieldByName('CD_PLANO').asInteger;
       wwqryCalculo.Open;
     end;  
   end;
  bbtnCancelar.Click;
end;

procedure TfrmVersaoBaseHist.dbnavClick(Sender: TObject; Button: TNavigateBtn);
begin
  LkcTbVersao.Text := qryVersao.FieldByName('DS_VERSAO').asString;
end;

procedure TfrmVersaoBaseHist.LkcTbVersaoChange(Sender: TObject);
begin
  qryPrincipal.Close;
  qryPrincipal.Open;
end;

procedure TfrmVersaoBaseHist.PageControlChange(Sender: TObject);
begin
  dbnav.Visible := (PageControl.ActivePage = TbShVersao);
end;

end.
