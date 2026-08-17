unit fMTCadAlmoxCAF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, FSairAjuda, IvDictio, IvMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Mask, wwdbedit, DBCtrls, MontaSelect, DB,
  DBClient, uCMClientDataSet, Wwdatsrc, 
  uCtrlGrupoContab, uCtrlClassedeBem, uCtrlConjunto, uCtrlPadroes, uCtrlBem,
  uCtrlAlmoxCAF, uCtrlParamCAF, IvEMulti, fcLabel;

type
  TfrmMTCadAlmoxCaf = class(TfrmSairAjuda)
    dsConjunto: TwwDataSource;
    cdsConjunto: TCMClientDataSet;
    MSConjunto: TMontaSelect;
    dsGrupo: TwwDataSource;
    cdsGrupo: TCMClientDataSet;
    MSClasse: TMontaSelect;
    dsClasse: TwwDataSource;
    cdsClasse: TCMClientDataSet;
    Label3: TLabel;
    dbeConjunto: TDBMemo;
    bbtnGeraConjunto: TBitBtn;
    bbtnSelConjunto: TBitBtn;
    Label4: TLabel;
    dbeDescLocalizacao: TwwDBEdit;
    dbeNomeResponsavel: TwwDBEdit;
    Label5: TLabel;
    Label13: TLabel;
    Label1: TLabel;
    dbeDescClasse: TwwDBEdit;
    bbtnSelClasse: TBitBtn;
    Label27: TLabel;
    cmbControle: TComboBox;
    Label7: TLabel;
    dbeDesBem: TDBMemo;
    Label8: TLabel;
    edDescGrupo: TwwDBEdit;
    dbeTaxaDep: TwwDBEdit;
    Label2: TLabel;
    Label11: TLabel;
    bbtnCancelar: TBitBtn;
    bbtnConfirmar: TBitBtn;
    dsAlmoxCAF: TwwDataSource;
    dbePlaca: TwwDBEdit;
    bbtnGeraPlaca: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnGeraConjuntoClick(Sender: TObject);
    procedure bbtnSelConjuntoClick(Sender: TObject);
    procedure bbtnSelClasseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnGeraPlacaClick(Sender: TObject);
  private
    { Private declarations }
    AlmoxCAF    : TCtrlAlmoxCAF;
    GrupoContab : TCtrlGrupoContab;
    ClassedeBem : TCtrlClassedeBem;
    Conjunto    : TCtrlConjunto;
    Bem         : TCtrlBem;
    ParamCAF    : TCtrlParamCAF;
    function CMTranslate(sIgor : String) : String;
  public
    { Public declarations }
  end;

var
  frmMTCadAlmoxCaf: TfrmMTCadAlmoxCaf;

implementation

{$R *.dfm}

Uses uMensErro, uSistema, fMTCadConjunto;

procedure TfrmMTCadAlmoxCaf.FormCreate(Sender: TObject);
begin
   inherited;
   AlmoxCAF := TCtrlAlmoxCAF.Create;
   AlmoxCAF.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.InitializeAs(Padroes);
   if not ParamCAF.CarregaProp(Sistema.IdEmpresa) then
   begin
      MsgDlg('Parâmetros do Ativo Fixo inválidos para esta Empresa!',
             'Erro', mtError,[mbOK],0);
      bbtnSair.Click;
   end;
   if ParamCAF.EDITACODBEM = 1 then
   begin
      bbtnGeraPlaca.Enabled := True;
      dbePlaca.ReadOnly     := True;
   end else
   begin
      bbtnGeraPlaca.Enabled := False;
      dbePlaca.ReadOnly     := False;
   end;
   //-------------------------------------------------------------------------------------
   GrupoContab := TCtrlGrupoContab.Create;
   GrupoContab.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   ClassedeBem := TCtrlClassedeBem.Create;
   ClassedeBem.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   Conjunto := TCtrlConjunto.Create;
   Conjunto.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   Bem := TCtrlBem.Create;
   Bem.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   MSConjunto.Filtro.Add('CONJUNTO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
end;
//========================================================================================
procedure TfrmMTCadAlmoxCaf.FormShow(Sender: TObject);
begin
   inherited;
   if not dsAlmoxCAF.DataSet.IsEmpty then
   begin
      if (dsAlmoxCAF.DataSet.FieldByName('CONTROLE').AsString = 'T') or
         (dsAlmoxCAF.DataSet.FieldByName('CONTROLE').IsNull) then
         cmbControle.Text := CMTranslate('Total')
      else
         cmbControle.Text := CMTranslate('Físico');
      //----------------------------------------------------------------------------------
      cdsClasse.Data   := ClassedeBem.ListaClassedeBem(dsAlmoxCAF.DataSet.FieldByName('IDCLASSEBEM').AsFloat);
      cdsConjunto.Data := Conjunto.ListaConjunto(dsAlmoxCAF.DataSet.FieldByName('IDPESSOA').AsFloat, dsAlmoxCAF.DataSet.FieldByName('IDCONJUNTO').AsFloat);
      cdsGrupo.Data    := GrupoContab.ListaGrupoContab(dsAlmoxCAF.DataSet.FieldByName('IDPESSOA').AsFloat,dsAlmoxCAF.DataSet.FieldByName('IDGRUPO').AsFloat);
   end else
   begin
      MsgDlg('Erro na transferência dos dados do Almoxarifado para o Ativo Fixo!','Erro',
             mtError,[mbOK],0);
      bbtnSair.Click;
   end;
   //-------------------------------------------------------------------------------------
   dsAlmoxCAF.DataSet.Edit;
end;
//========================================================================================
procedure TfrmMTCadAlmoxCaf.bbtnSelClasseClick(Sender: TObject);
begin
   inherited;
   MSClasse.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSClasse.RetornouValor then
      cdsClasse.Data := ClassedeBem.ListaClassedeBem(strtofloat(MSClasse.ValoresChave[0]));
end;
//========================================================================================
procedure TfrmMTCadAlmoxCaf.bbtnGeraConjuntoClick(Sender: TObject);
begin
  inherited;
   Application.CreateForm(TfrmMTCadConjunto,frmMTCadConjunto);
   frmMTCadConjunto.FormStyle := FsNormal;
   frmMTCadConjunto.Visible   := False;
   frmMTCadConjunto.Top       := 76;
   frmMTCadConjunto.ShowModal;
   //-------------------------------------------------------------------------------------
   cdsConjunto.Data := Conjunto.ListaConjunto(frmMTCadConjunto.fUltIdPessoa, frmMTCadConjunto.fUltIdConjunto);
   frmMTCadConjunto.Release;
end;
//========================================================================================
procedure TfrmMTCadAlmoxCaf.bbtnSelConjuntoClick(Sender: TObject);
begin
   inherited;
   MSConjunto.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSConjunto.RetornouValor then
      cdsConjunto.Data := Conjunto.ListaConjunto(Sistema.IdEmpresa,
                                                 StrToFloat(MSConjunto.ValoresChave[0]));
end;
//========================================================================================
procedure TfrmMTCadAlmoxCaf.bbtnConfirmarClick(Sender: TObject);
begin
   if dbeDesBem.Text = '' then
   begin
      MsgDlg('Informe a Descrição do Bem!','Erro',mtError,[mbOk],0);
      dbeDesBem.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if cdsGrupo.FieldByName('FLGSEMPLACA').AsInteger = 0 then
   begin
      if dbePlaca.Text = '' then
      begin
         Bem.MessageInfo := CMTranslate('Número do Tombamento Patrimonial do Bem não informado!');
         dbePlaca.SetFocus;
         exit;
      end;
   end;
   //-------------------------------------------------------------------------------------
   if dbeDescClasse.Text = '' then
   begin
      MsgDlg('Informe a Classe do Bem!','Erro',mtError,[mbOk],0);
      bbtnSelClasse.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if dbeConjunto.Text = '' then
   begin
      MsgDlg('Selecione o Conjunto do Bem!','Erro',mtError,[mbOk],0);
      bbtnSelConjunto.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   dsAlmoxCAF.DataSet.FieldByName('IDMODULO').AsInteger    := Sistema.IdModulo;
   dsAlmoxCAF.DataSet.FieldByName('IDPESSOA').AsInteger    := Sistema.IdEmpresa;
   if cmbControle.Text = CMTranslate('Total') then
      dsAlmoxCAF.DataSet.FieldByName('CONTROLE').AsString  := 'T'
   else
      dsAlmoxCAF.DataSet.FieldByName('CONTROLE').AsString  := 'F';
   dsAlmoxCAF.DataSet.FieldByName('IDCLASSEBEM').AsInteger := cdsClasse.FieldByName('IDCLASSEBEM').AsInteger;
   dsAlmoxCAF.DataSet.FieldByName('IDCONJUNTO').AsInteger  := cdsConjunto.FieldByName('IDCONJUNTO').AsInteger;
   //-------------------------------------------------------------------------------------
   dsAlmoxCAF.DataSet.Post;
   bbtnSair.Click;
end;
//========================================================================================
procedure TfrmMTCadAlmoxCaf.bbtnCancelarClick(Sender: TObject);
begin
   dsAlmoxCAF.DataSet.Cancel;
   bbtnSair.Click;
end;
//========================================================================================
procedure TfrmMTCadAlmoxCaf.bbtnGeraPlacaClick(Sender: TObject);
begin
   inherited;
   dsAlmoxCAF.DataSet.FieldByName('PLACA').AsFloat := AlmoxCAF.GeraPlacaTomb(Sistema.IdEmpresa,
                                                                             cdsGrupo.FieldByName('IDGRUPO').AsFloat,
                                                                             cdsClasse.FieldByName('IDCLASSEBEM').AsFloat);
   if dsAlmoxCAF.DataSet.FieldByName('PLACA').AsFloat = -1 then
      MsgDlg('Erro na Geração da Placa!' + #13 +
             'Causa : ' + AlmoxCAF.MessageInfo,'Erro',mtError,[mbOk],0);
end;
//========================================================================================
procedure TfrmMTCadAlmoxCaf.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   AlmoxCAF.Free;
   ClassedeBem.Free;
   GrupoContab.Free;
   Conjunto.Free;
   Bem.Free;
   ParamCAF.Free;
end;

function TfrmMTCadAlmoxCaf.CMTranslate(sIgor: String): String;
begin
   Result := sIgor;
end;

end.
