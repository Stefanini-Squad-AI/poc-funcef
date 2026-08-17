//******************************************************************************
// Autor     : Ricardo Cristiano
// Data      : 06/06/2006
// Código    : Al_1
// Pendencia :
// SOL       :
// Motivo    : Retirada a opção de todos os módulos
//******************************************************************************
// Autor    : Fabio Fagundes
// Data     : 18/05/2005
// Código   :                                      
// Motivo   : Filtrado os Tipos de Investimento para não trazer o IDTIPOINVEST (3 E 4)
//            na qryTipoInvest (Antigo Imobiliário e Empréstimo)
//******************************************************************************

unit FCadTipoInvUsu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, DBCtrls, wwdblook;

type
  TfrmCadTipoInvUsu = class(TfrmCadastroCS)
    qryIDUSUARIO: TFloatField;
    qryNOMEUSUARIO: TStringField;
    qryIDTIPOINVEST: TFloatField;
    qryDESCTIPOINVEST: TStringField;
    qryTIPOMENU: TStringField;
    dblUsuario: TwwDBLookupCombo;
    qryNomeUsu: TwwQuery;
    qryNomeUsuIDUSUARIO: TFloatField;
    qryNomeUsuNOMEUSUARIO: TStringField;
    qryTipoInvest: TwwQuery;
    dblTipoInvest: TwwDBLookupCombo;
    qryTipoInvestIDTIPOINVEST: TFloatField;
    qryTipoInvestDESCTIPOINVEST: TStringField;
    Label2: TLabel;
    Label3: TLabel;
    dbrMenuSelecionado: TDBRadioGroup;
    dblPlano: TwwDBLookupCombo;
    Label1: TLabel;
    qryIDPLANPREVCTBPATR: TFloatField;
    QryPatroPlanPrevContab: TwwQuery;
    QryPatroPlanPrevContabIDPLANPREVCTBPATR: TFloatField;
    QryPatroPlanPrevContabIDPLANOPREV: TFloatField;
    QryPatroPlanPrevContabIDPATRO: TFloatField;
    QryPatroPlanPrevContabPLANPRVCONTABPATRO: TStringField;
    QryBuscaUsuMenu: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroConfirma(Sender: TObject);
  private
    { Private declarations }
    procedure Sel(S: Integer);
  public
    { Public declarations }
  end;

var
  frmCadTipoInvUsu: TfrmCadTipoInvUsu;

implementation

Uses UDataBase, uMensErro, UBibliotecaInvest,USistema, FPrincipal;
{$R *.DFM}

{ TfrmCadTipoInvUsu }

procedure TfrmCadTipoInvUsu.Sel(S: Integer);
begin
  qry.Close;
  qry.ParamByName('IDUSUARIO').AsInteger := S;
  qry.Open;
end;

procedure TfrmCadTipoInvUsu.FormCreate(Sender: TObject);
begin
  inherited;
  Sel(-1);
  qryNomeUsu.Open;
  qryTipoInvest.Open;
  QryPatroPlanPrevContab.Open;
end;

procedure TfrmCadTipoInvUsu.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
     Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadTipoInvUsu.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
//  inherited;
  Accept := False;
  if Trim(dblUsuario.Text) = '' then
  begin                                       
     MsgDlg('Usuário não Preenchido','Atenção',mtError,[mbOK],0);
     dblUsuario.SetFocus;
     Exit;
  end;

  if dbrMenuSelecionado.ItemIndex = -1 then
  begin
     MsgDlg('Selecione um Tipo de Menu','Atenção',mtError,[mbOK],0);
     dbrMenuSelecionado.SetFocus;
     Exit;
  end;

  if (qry.State in [dsInsert]) and (Trim(dblUsuario.Text) <> '') then
  Begin
     QryBuscaUsuMenu.close;
     QryBuscaUsuMenu.ParamByName('IDUSUARIO').AsInteger :=qryNomeUsu.FieldByName('IDUSUARIO').AsInteger;
     QryBuscaUsuMenu.Open;
     If Not (QryBuscaUsuMenu.IsEmpty) Then
     Begin
        MsgDlg('Usuário Cadastrado ! Favor Alterar.  ','Atenção',mtError,[mbOK],0);
        Exit;
     End;
  End;

  if (qry.State in [dsEdit, dsInsert]) and (Trim(dblTipoInvest.Text) = '') then
     qryIDTIPOINVEST.Clear;

  Accept := True;
end;

procedure TfrmCadTipoInvUsu.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  SelectFirst;
end;

procedure TfrmCadTipoInvUsu.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
     Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadTipoInvUsu.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryNomeUsu.Close;
  qryTipoInvest.Close;
  QryPatroPlanPrevContab.Close;
  inherited;
end;

procedure TfrmCadTipoInvUsu.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  if qryIDUSUARIO.AsInteger = Sistema.IdUsuario then
  begin
     iTipoInvestUsu := qryIDTIPOINVEST.AsInteger;
     case dbrMenuSelecionado.ItemIndex of
        //Al_1 - Ricardo - 06/06/2006
        0: FrmPrincipal.MudaMenu(iTipoInvestUsu,'F');
        1: FrmPrincipal.MudaMenu(iTipoInvestUsu,'V');
        2: FrmPrincipal.MudaMenu(iTipoInvestUsu,'B');
        3: FrmPrincipal.MudaMenu(iTipoInvestUsu,'I');
     end;
  end;

end;
                            
END.
