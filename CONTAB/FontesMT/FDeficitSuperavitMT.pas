unit FDeficitSuperavitMT;
{------------------------------------------------------------------------------
  Desenvolvedor: Rodolpho da Silva
  Método       : ApuraResultadoPer
  Data         : 13/04/2005
  Pendência    : 18438
  Descrição    : Adicionar filtro por Plano x Patro
------------------------------------------------------------------------------}
{ Pend: 14564 - 18/08/2003 CBS
  Caso o usuário não parametrize a conta de Fundo de Cobertura e Oscilação de
  Risco o sistema joga todo valor para Reserva de Contingência.
  Esta premissa não vale para o lançamento da meia-noite.
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, ComCtrls, wwdbdatetimepicker, CMDateTimePicker, uCtrlListTerceiros,
  wwdblook, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Db, DBClient, uCMClientDataSet,  uCtrlProcessaContab,uCtrlContab,
  uCtrlPeriodo, uCMTypes, uCtrlPlanPrevContabPatro, DBTables, Wwquery,
  Mask, DBCtrls;


type
  TfrmDeficitSuperavitMT = class(TfrmOkCancelar)
    dblkExerc: TwwDBLookupCombo;
    Label3: TLabel;
    dblkPeriodo: TwwDBLookupCombo;
    Label4: TLabel;
    eddataproc: TCMDateTimePicker;
    Label14: TLabel;
    mmTxt: TRichEdit;
    Label1: TLabel;
    cdsExercicio: TCMClientDataSet;
    cdsPeriodo: TCMClientDataSet;
    Label2: TLabel;
    cboPlano: TwwDBLookupCombo;
    cboPatro: TwwDBLookupCombo;
    Label5: TLabel;
    Label6: TLabel;
    cdsPlano: TCMClientDataSet;
    cdsPatro: TCMClientDataSet;
    eddataproc1: TEdit;
    qryAux: TwwQuery;
    dsqryaux: TDataSource;
    EdOper: TDBEdit;
    procedure dblkExercExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cboPlanoEnter(Sender: TObject);
    procedure cboPatroEnter(Sender: TObject);
    procedure dblkPeriodoExit(Sender: TObject);
  private
    CtrlContab         :TCtrlContab;
    CtrlProcessaContab :TCtrlProcessaContab;
    CtrlPeriodo        :TCtrlPeriodo;
    ListTerceiros      :TCtrlListTerceiros;

    CtrlPlanPrevContabPatro : TCtrlPlanPrevContabPatro;

    procedure ProcMensDef(msg: String);

  public
    { Public declarations }
  end;



var
  frmDeficitSuperavitMT: TfrmDeficitSuperavitMT;

implementation



uses UMensErro, uDatabase, DBaseDados,  uSistema, uData;

{$R *.DFM}



procedure TfrmDeficitSuperavitMT.dblkExercExit(Sender: TObject);
begin
  inherited;
  cdsPeriodo.Data := CtrlPeriodo.ListPeriodo(Sistema.idEmpresa,tbpTodos,StrToInt(dblkExerc.LookupValue),0);

end;




procedure TfrmDeficitSuperavitMT.FormCreate(Sender: TObject);
var
sSql: string;
begin
  inherited;
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
     MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);


  // *** Instancia a classe processa contab ***
  CtrlProcessaContab := TCtrlProcessaContab.Create;
  CtrlProcessaContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,False,ProcMensDef);

  //Criação da Classe de Negócio
  CtrlPeriodo        := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  // *** Instancia a classe ListTerceiros ***
  ListTerceiros  := TCtrlListTerceiros.Create;
  ListTerceiros.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                           Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  // Início - Rodolpho da Silva - P: 18438 - 13/04/2005
  CtrlPlanPrevContabPatro := TCtrlPlanPrevContabPatro.Create;
  CtrlPlanPrevContabPatro.InitializeAs(ListTerceiros);
  // Fim    -  Rodolpho da Silva - P: 18438 - 13/04/2005
            
  cdsExercicio.Data := CtrlPeriodo.ListExercicios(Sistema.idEmpresa,False);
  cdsPeriodo.Data   := CtrlPeriodo.ListPeriodo(Sistema.idEmpresa,tbpTodos,0,0);
  qryaux.Close;
  sSql := ' SELECT T.TIPDESCRICAO FROM TIPOPER T, PARAMCONTAB P WHERE T.TIPCODIGO=PACTIPOPERRESULT';
  qryaux.Sql.Text := sSql;
  qryaux.Open;



end;




procedure TfrmDeficitSuperavitMT.ProcMensDef(msg: String);
begin
  If Sistema.ConnectionSide <> CnsClient Then
  Begin
    If msg <> '*' then
    begin
       mmTxt.Lines.Add(Msg);
    end;
    Application.ProcessMessages;
  End;

end;




procedure TfrmDeficitSuperavitMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlContab.free;
  CtrlProcessaContab.free;
  CtrlPeriodo.free;
  ListTerceiros.free;

  FreeAndNil(CtrlPlanPrevContabPatro);
end;



procedure TfrmDeficitSuperavitMT.bbtnConfirmarClick(Sender: TObject);
var
   iIdPlano, iIdPatro: integer;
   bInclui : boolean;
begin

  inherited;

   if cboPatro.Text <> '' then
      iIdPatro := cdsPatro.FieldByName('IDPATRO').AsInteger
   else
     iIdPatro := -1;

   if cboPlano.Text <> '' then
     iIdPlano := cdsPlano.FieldByName('IDPLANOPREV').AsInteger
   else
     iIdPlano := -1;

   if dblkPeriodo.Text = '' then
   begin
      MsgDlg('Período não escolhido','Erro',mtError,[mbOk],0);
      exit;
   end;

   mmTxt.Lines.Add('Processando Saldo do Programa Previdenciário...');
   mmTxt.Lines.Add(' ');


   If CtrlProcessaContab.ApuraResultadoPer(Sistema.IdModulo,Sistema.IdEmpresa,Sistema.idUsuario,CtrlContab.PlanoParam,
                          StrToInt(dblkExerc.LookupValue),
                          iIdPlano,iIdPatro,
                          StrToInt(dblkPeriodo.LookupValue),
                          CtrlContab.ProgPrev, CtrlContab.CodHist, CtrlContab.DefTec,
                          CtrlContab.ResCont,CtrlContab.FormDefTec,CtrlContab.RevSupTecn,
                          CtrlContab.FormSupTec,CtrlContab.FdoCobOscRisc,CtrlContab.ResMat,
                          CtrlContab.RevDefTec,eddataproc1.Text,'', Sistema.UsaPlanoPatro) then

   begin
     MsgDlg(CtrlProcessaContab.MessageInfo,'Aviso',mtWarning,[mbOk], 0);
   end else
   begin
     MsgDlg(CtrlProcessaContab.MessageInfo,'Erro',mtError,[mbOk],0);
   end;

   If Sistema.ConnectionSide = CnsClient Then
   Begin
     mmTxt.Lines.Add(CtrlProcessaContab.sMensAPS_Log);
   End;

end;




procedure TfrmDeficitSuperavitMT.FormShow(Sender: TObject);
begin
  inherited;
  if (CtrlContab.DefTec        = '') or (CtrlContab.ProgPrev   = '') or
     (CtrlContab.ResCont       = '') or (CtrlContab.FormDefTec = '') or
     (CtrlContab.RevSupTecn    = '') or (CtrlContab.FormSupTec = '') or
     (CtrlContab.ResMat     = '') or
     (CtrlContab.RevDefTec     = '') or (CtrlContab.CodHist    = '') then
  begin
     MsgDlg('Contas de Apuração de Resultado não preenchidas totalmente','Erro',mtError,[mbOk],0);
     bbtnSair.Click;
     exit;
  end;

end;




procedure TfrmDeficitSuperavitMT.FormActivate(Sender: TObject);
begin
  inherited;
  dblkExerc.LookupValue := IntToStr(CtrlContab.ExercicioAtual);
end;



procedure TfrmDeficitSuperavitMT.cboPlanoEnter(Sender: TObject);
begin
  inherited;
  if cboPatro.Text <> '' then
     cdsPlano.Data := CtrlPlanPrevContabPatro.ListaPlanoPatro(-1,cdsPatro.FieldByName('IDPATRO').AsInteger,-1)
  else
     cdsPlano.Data := CtrlProcessaContab.listaPlanoPrev;
end;



procedure TfrmDeficitSuperavitMT.cboPatroEnter(Sender: TObject);
begin
  inherited;
  if cboPlano.Text <> '' then
     cdsPatro.Data := CtrlPlanPrevContabPatro.ListaPlanoPatro(cdsPlano.FieldByName('IDPLANOPREV').AsInteger,-1,-1)
  else
     cdsPatro.Data := CtrlProcessaContab.ListaPatro;
end;

procedure TfrmDeficitSuperavitMT.dblkPeriodoExit(Sender: TObject);
begin
  inherited;
  eddataproc1.Text :=DiasUteis.UltimoDiaMes('1/' + dblkPeriodo.LookupValue + '/' + dblkExerc.LookupValue);

end;

end.
