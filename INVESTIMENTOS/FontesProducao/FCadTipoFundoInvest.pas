//******************************************************************************
// Data      : 14/03/2008
// Código    : AL_7
// Motivo    : Implementação da senha de alteração.
//******************************************************************************
// Data      : 27/08/2007
// Código    : AL_6
// Pendencia : 26200
// Motivo    : Implementação de ajuste na exclusão. A busca do procurar não estava
//             no evento correto.
//******************************************************************************
// Data      : 09/08/2007
// Código    : AL_5
// Motivo    : Acerto na filtragem da qryTipoInvestimento quando o iTipoInvestUsu = 0 (Todos)
//******************************************************************************
// Data      : 27/06/2007
// Código    : AL_4
// Pendencia : 25703
// Motivo    : Retirada a autorização de alteração das datas de último fechamento
//******************************************************************************
// Data      : 21/08/2006
// Código    : AL_3
// Pendencia : 22946
// SOL       : 45112
// Motivo    : Implementação do Fundo de Inv. em Participação
//******************************************************************************
//Data	  :  16/03/2006
//Codigo  :  AL_2
//Função  :  Implementação da tela de autorização para alteração, liberando a data de último fechamento para edição.
//******************************************************************************
//Data	  :  13/09/2005
//Codigo  :  AL_1
//Função  :  Travamento de alteração da data de último fechamento pois por exemplo :
//           Se for alterada para data anterior e depois alterado um valor de cota e fizer o fechamento,
//           o Sistema duplica os Lançamentos porque a rotina nâo exclui os registros existentes
//******************************************************************************

unit FCadTipoFundoInvest;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, Db, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, wwdblook, Mask, wwdbedit, CmEventosCadastro, ImgList,
  wwdbdatetimepicker, CMDateTimePicker, FCadastroCSInv, fcLabel;

type
  TfrmCadTipoFundoInvest = class(TfrmCadastroCSInv)
    qryIDTIPOFUNDOINVEST: TFloatField;
    qryIDTIPOINVEST: TFloatField;
    qryDESCTIPOFUNDOINV: TStringField;
    dbeDescricao: TwwDBEdit;
    dblTipoInvest: TwwDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    qryTipoInvestimento: TwwQuery;
    qryTipoInvestimentoIDTIPOINVEST: TFloatField;
    qryTipoInvestimentoDESCTIPOINVEST: TStringField;
    Label45: TLabel;
    dbdDtaFechFdo: TCMDateTimePicker;
    qryDATAULTFECH: TDateTimeField;
    Label3: TLabel;
    qrySegmentacao: TwwQuery;
    qrySegmentacaoIDSEGMENTACAO: TFloatField;
    qrySegmentacaoDESCSEGMENTACAO: TStringField;
    dblSegmentacaoMercado: TwwDBLookupCombo;
    qryIDSEGMENTACAO: TFloatField;
    QryAux: TwwQuery;
    procedure FormCreate(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    //AL_6
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Sel(S : LongInt);
  public
    { Public declarations }
  end;

var
  frmCadTipoFundoInvest: TfrmCadTipoFundoInvest;

implementation

Uses UDataBase, uMensErro, UBibliotecaInvest, USistema, FAutorizaParametros,
//AL_2
     FTelaAut, DBaseDados,
     //AL_5
     uOperComum;
{$R *.DFM}

procedure TfrmCadTipoFundoInvest.Sel(S : LongInt);
begin
  qry.Close;
  qry.ParamByName('P_IDTIPOFUNDOINVEST').AsInteger := S;
  qry.Open;
end;

procedure TfrmCadTipoFundoInvest.FormCreate(Sender: TObject);
begin
  inherited;
  Sel(-1);
  if iTipoInvestUsu <> 0 then
     MontaSelect.Filtro.Add('TIPOFUNDOINVEST.IDTIPOINVEST = ' + IntToStr(iTipoInvestUsu));
end;

procedure TfrmCadTipoFundoInvest.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  //AL_6
  If MontaSelect.RetornouValor Then
     Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadTipoFundoInvest.CmeCadastroConfirma(Sender: TObject);
begin
  if dblTipoInvest.Text = '' then
    qryIDTIPOINVEST.AsString := '';

  if qry.State = dsInsert Then
     qryIDTIPOFUNDOINVEST.AsInteger := LeUltRegistro(nil, 'TIPOFUNDOINVEST');
  inherited;
end;

procedure TfrmCadTipoFundoInvest.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
begin
  Accept := False;
  If dblTipoInvest.LookupValue = '' Then
     begin
       MsgDlg('Tipo de Investimento não preenchido','Erro',mtError,[mbOK],0);
       dblTipoInvest.SetFocus;
     end
  Else
  If Trim(dbeDescricao.Text) = '' Then
     begin
       MsgDlg('Descrição não preenchida','Erro',mtError,[mbOK],0);
       dbeDescricao.SetFocus;
     end
  Else
    Accept := True;
end;

procedure TfrmCadTipoFundoInvest.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  SelectFirst;
end;

//AL_6

procedure TfrmCadTipoFundoInvest.FormShow(Sender: TObject);
begin
  inherited;
  //AL_5
  OperComum.LimpaParametros(qryTipoInvestimento);
  if iTipoInvestUsu <> 0 then
     qryTipoInvestimento.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
  qryTipoInvestimento.Open;

 { OperComum.LimpaParametros(QrySegmentacao);
  if iTipoInvestUsu <> 0 then
    QrySegmentacao.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
  QrySegmentacao.Open;     }

  QrySegmentacao.Close;
  QrySegmentacao.Open;
end;

procedure TfrmCadTipoFundoInvest.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryTipoInvestimento.Close;
  QrySegmentacao.Close;
end;
// AL_7
procedure TfrmCadTipoFundoInvest.sbtnAlterarClick(Sender: TObject);
begin
   if((Pos('.CM',Sistema.NomeUsuario) > 0) or
      (AbrirFormModal(frmAutorizaParametros,TfrmAutorizaParametros) = mrOk)) then
   begin
     inherited;

      dbdDtaFechFdo.Enabled := True;
   end
   else
      dbdDtaFechFdo.Enabled := False;
end;

procedure TfrmCadTipoFundoInvest.bbtnConfirmarClick(Sender: TObject);
begin

  If dblSegmentacaoMercado.LookupValue = '' Then
     begin
       MsgDlg('Segmentacao de Mercado não preenchida','Erro',mtError,[mbOK],0);
       dblSegmentacaoMercado.SetFocus;
       Exit;
     end;

  inherited;

end;

procedure TfrmCadTipoFundoInvest.sbtnApagarClick(Sender: TObject);
begin
  //inherited;
  with QryAux do begin
    close;
    sql.clear;
    sql.Add('SELECT IDTIPOFUNDOINVEST FROM PADRLANCCONTINV  ');
    sql.Add('WHERE IDTIPOFUNDOINVEST = '''+ Qry.fieldByName('IDTIPOFUNDOINVEST').AsString +'''');
    Open;
  end;

   if not QryAux.IsEmpty then
   Begin
      MsgDlg('Código do Tipo de Fundo: '+ Qry.fieldByName('DESCTIPOFUNDOINV').AsString + #13 +
             'está em uso na Parametrização Contábil.','Mensagem do Sistema ', MtError, [MbOk],0);
      Exit;
   End
   else
   begin
      If (MsgDlg('Deseja realmente excluir este registro ?',
         'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) Then
      Begin
         With qryAux Do
         Begin
            Try
               if not dtmBaseDados.dbBaseDados.InTransaction then
                  dtmBaseDados.dbBaseDados.StartTransaction;

               if not ExecutaQuery(QryAux,'DELETE FROM TIPOFUNDOINVEST WHERE IDTIPOFUNDOINVEST = '+
                                           QuotedStr(qry.FieldByName('IDTIPOFUNDOINVEST').AsString)) then
                  Raise Exception.Create('Não foi possível excluir o Tipo de Fundo. '+ qry.FieldByName('DESCTIPOFUNDOINV').AsString);

               DtmBaseDados.dbBaseDados.Commit;
            except on E: Exception do
               begin
                  DtmBaseDados.dbBaseDados.Rollback;
                  MsgDlg('Ocorreu um problema na exclusão do Tipo de Fundo.'+ #13 +
                          E.Message,'Mensagem do Sistema ',mtError,[mbOK],0);
               end;
            End;
         End;
      End;
   end;
   qry.Close;
   qry.Open;
   bbtnCancelarClick(sender);
   
  //Inherited;
  SbtnApagar.Down := False;
end;

end.
