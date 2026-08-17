//Marcus Oliveira P. 25845 19/07/2007 - Corrigido a tela que sumia com os valores no momento de atualiza-los.


unit FCadUsuxTpdpctoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, CmEventosCadastro, ImgList,
  uCmSqlParams, DBClient, uCMClientDataSet, uCtrlCadUsuxTpdpcto, uCtrlPadroes;

type
  TFrmCadUsuxTpdpctoMT = class(TFrmCadastroMT)
    Label1: TLabel;
    EdUsu: TEdit;
    plnTransf: TPanel;
    btnAdiciona: TSpeedButton;
    BtnRemove: TSpeedButton;
    grdTranf: TwwDBGrid;
    GrdTodos: TwwDBGrid;
    dsTpdocto: TwwDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    BtnAdicionaTudo: TSpeedButton;
    btnRemoveTudo: TSpeedButton;
    sql: TCMSqlParams;
    sqlTpDocTo: TCMSqlParams;
    cdsTpDocTo: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

    procedure btnAdicionaClick(Sender: TObject);
    procedure BtnRemoveClick(Sender: TObject);
    procedure BtnAdicionaTudoClick(Sender: TObject);
    procedure btnRemoveTudoClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
  private
    _CtrlCadUsuxTpdpcto : TCtrlCadUsuxTpdpcto;
    { Private declarations }
  public
    { Public declarations }
    iIDUsuario : Integer;
    Procedure Sel( n : LongInt );
  end;

var
  FrmCadUsuxTpdpctoMT : TFrmCadUsuxTpdpctoMT;

implementation

{$R *.DFM}

Uses uSistema, uMensErro, uCtrlParamIntegra, uCMTypes, uDataBase, dBaseDados;

procedure TFrmCadUsuxTpdpctoMT.FormCreate(Sender: TObject);
begin
  inherited;
  _CtrlCadUsuxTpdpcto := TCtrlCadUsuxTpdpcto.Create;
  _CtrlCadUsuxTpdpcto.InitializeAs(Padroes);
  _CtrlCadUsuxTpdpcto._Cds := Cds;

  if ParamIntegra.RecPag = 'R' then
  begin
    HelpContext           := 40015;
    bbtnAjuda.HelpContext := 40015;
  end
  else
  begin
// Daniel Simões - 25/01/2006 - Início------------------------------------------
    HelpContext           := 30055;
    bbtnAjuda.HelpContext := 30055;
// Daniel Simões - 25/01/2006 - Fim---------------------------------------------
  end;

  Sel(-1);
  edUsu.Clear;
end;

Procedure TFrmCadUsuxTpdpctoMT.Sel( n : LongInt );
begin
   iIdUsuario := n;
   sql.Prepare;
   sql.ParamByName('pIDUSUARIO').AsInteger := n;
   sql.ParamByName('RECPAG').Asstring  := ParamIntegra.RecPag;
   sql.Open;

   sqlTpdocto.Prepare;
   sqlTpdocto.ParamByName('IDUSUARIO').AsInteger := n;
   sqlTpdocto.ParamByName('RECPAG').AsString     := ParamIntegra.RecPag;
   sqlTpdocto.Open;
end;

procedure TFrmCadUsuxTpdpctoMT.CmeCadastroFind(Sender: TObject);
begin
  Inherited;
  if MontaSelect.RetornouValor Then
  begin
    Sel(StrToInt(MontaSelect.ValoresChave[0]) );
    edUsu.Text := MontaSelect.ValoresChave[1];
  end;
end;

procedure TFrmCadUsuxTpdpctoMT.btnAdicionaClick(Sender: TObject);
begin
  inherited;
  If CmeCadastro.Operacao in [opInserir,opAlterar] Then
    Begin
       If Not cdsTpdocto.IsEmpty Then
         Begin
            With cds Do
               Begin
                 Append;
                 FieldByName('IDUSUARIO').AsInteger := iIDUsuario;
                 FieldByName('RECPAG').AsString     := ParamIntegra.RecPag;
                 FieldByName('CODtipdoc').AsInteger := cdsTpdocto.FieldByName('CODTIPDOC').AsInteger;
                 FieldByName('DESCricao').AsString  := cdsTpdocto.FieldByName('DESCRICAO').AsString;
                 Post;
                End;
            CdsTpdocto.Delete;
         End;
    End;
end;

procedure TFrmCadUsuxTpdpctoMT.BtnRemoveClick(Sender: TObject);
begin
  inherited;
  If CmeCadastro.Operacao in [opInserir,opAlterar] Then
    Begin
      If Not cds.IsEmpty Then
       Begin
          With cdsTpdocto Do
             Begin
               Append;
               FieldByName('CODtipdoc').AsInteger := cds.FieldByName('CODtipdoc').AsInteger;
               FieldByName('DESCricao').AsString  := cds.FieldByName('DESCricao').AsString;
               Post;
             End;
          cds.Delete;
       End;
    End;
end;

procedure TFrmCadUsuxTpdpctoMT.BtnAdicionaTudoClick(Sender: TObject);
begin
  inherited;
  cdsTpdocto.First;
  while not cdsTpdocto.Eof do
    btnAdiciona.Click;
end;

procedure TFrmCadUsuxTpdpctoMT.btnRemoveTudoClick(Sender: TObject);
begin
  inherited;
  cds.First;
  While Not cds.Eof Do
    btnRemove.Click;
end;

procedure TFrmCadUsuxTpdpctoMT.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  _CtrlCadUsuxTpdpcto.Free;
end;

procedure TFrmCadUsuxTpdpctoMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := _CtrlCadUsuxTpdpcto.GravaCadUsuxTpdPcto;
end;

procedure TFrmCadUsuxTpdpctoMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := _CtrlCadUsuxTpdpcto.GravaCadUsuxTpdPcto;
end;

procedure TFrmCadUsuxTpdpctoMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  Sel(cds.FieldByName('IDUSUARIO').AsInteger);

end;

//Marcus Oliveira P. 25845 19/07/2007 Criado pra fazer a crítica quando não tiver escolhido usuário.
procedure TFrmCadUsuxTpdpctoMT.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  If Trim(edUsu.Text) = '' Then
    Begin
        MsgDlg('Selecione um Usuário! ','Atenção',mtWarning,[mbOk],0);
        bbtnCancelar.Click;
    End

end;

end.
