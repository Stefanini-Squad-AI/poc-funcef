unit FLancMeiaNoiteMT;

{
  31/07/03 by Alex - Pend 14564 - corrigido de PERDATAFIM para PERDATFIM
  ref CtrlPeriodo.ListPerExercicio
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBClient, uCMClientDataSet, ComCtrls,
  wwdblook,uCtrlContab,uCtrlProcessaContab,uCtrlPeriodo,
   {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

type
  TfrmLancMeiaNoiteMT = class(TfrmSairAjuda)
    dblkExerc: TwwDBLookupCombo;
    Label3: TLabel;
    mmTxt: TRichEdit;
    cdsExercicio: TCMClientDataSet;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    CtrlContab         :TCtrlContab;
    CtrlProcessaContab :TCtrlProcessaContab;
    CtrlPeriodo        :TCtrlPeriodo;
    procedure ProcMensMeia(msg: String);

  public
    { Public declarations }
  end;

var
  frmLancMeiaNoiteMT: TfrmLancMeiaNoiteMT;

implementation

uses UMensErro, uDatabase, DBaseDados,  uSistema, uData;

{$R *.DFM}

procedure TfrmLancMeiaNoiteMT.FormCreate(Sender: TObject);
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
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,False,ProcMensMeia);

  //Criação da Classe de Negócio
  CtrlPeriodo        := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  cdsExercicio.Data := CtrlPeriodo.ListExercicios(Sistema.idEmpresa,False);

end;

procedure TfrmLancMeiaNoiteMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlContab.free;
  CtrlProcessaContab.free;
  CtrlPeriodo.free;

end;

procedure TfrmLancMeiaNoiteMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   if dblkExerc.Text = '' then begin
      MsgDlg('Exercício não escolhido','Erro',mtError,[mbOk],0);
      dblkExerc.SetFocus;
      exit;
   end;

   // 31/07 by Alex - Corrigido de PERDATAFIM para PERDATFIM
   CtrlPeriodo.RetornaPeriodoExercicioData(Sistema.IdEmpresa, cdsExercicio.FieldByName('PERDATFIM').asString);
   if CtrlPeriodo.Periodo = 0 then
   begin
      MsgDlg(CtrlPeriodo.MessageInfo,'Erro',mtError,[mbOk], 0);
      Exit;
   end;

   If CtrlProcessaContab.LancaMeiaNoite(Sistema.IdEmpresa,Sistema.idUsuario,
                        CtrlContab.PlanoParam,StrToInt(dblkExerc.LookupValue), CtrlPeriodo.Periodo,
                        CtrlContab.ProgPrev, CtrlContab.CodHist, CtrlContab.DefTec,
                        CtrlContab.DefTecA, CtrlContab.ResCont, CtrlContab.ResContA,
                        CtrlContab.FormDefTec,CtrlContab.RevSupTecn, CtrlContab.FormSupTec,
                        CtrlContab.FdoCobOscRisc,CtrlContab.FdoCobOscRiscA,CtrlContab.ResMat,
                        CtrlContab.RevDefTec,cdsExercicio.FieldByName('PERDATFIM').asString, // 31/07 by Alex - Corrigido de PERDATAFIM para PERDATFIM
                        Sistema.UsaPlanoPatro) then

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

procedure TfrmLancMeiaNoiteMT.FormActivate(Sender: TObject);
begin
  inherited;
  if (CtrlContab.DefTec  = '')       or (CtrlContab.ProgPrev   = '') or
     (CtrlContab.ResCont = '')       or (CtrlContab.FormDefTec = '') or
     (CtrlContab.RevSupTecn = '')    or (CtrlContab.FormSupTec = '') or
     (CtrlContab.FdoCobOscRisc = '') or (CtrlContab.ResMat = '')     or
     (CtrlContab.RevDefTec = '')     or (CtrlContab.CodHist = '') then
  begin
     MsgDlg('Contas de Apuração de Resultado não preenchidas totalmente','Erro',mtError,[mbOk],0);
     bbtnSair.Click;
     exit;
  end;

end;

procedure TfrmLancMeiaNoiteMT.ProcMensMeia(msg: String);
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

end.
