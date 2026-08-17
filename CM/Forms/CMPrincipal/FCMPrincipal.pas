unit FCMPrincipal;

{--------------------------------------------------------------------------------------
Rotinas   : ListaProcessosRADPendentes
Data      : 17/06/2005
Autor     : Alex Pereira
pendência :
Descrição : Substituido o médo de uCtrlRad para uCtrlEtapa
---------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMPrincipalForms, uResource, CorreioCM, SConnect, MConnect, Db,
  DBClient, AppEvnts, CMApplicationEvents, StdActns, ActnList, ImgList,
  IvDictio, IvAMulti, IvBinDic, Menus, IvMulti, IvEMulti, fcStatusBar,
  wwdblook, Mask, wwdbedit, StdCtrls, DBCtrls, ExtCtrls, TB97Tlwn,
  TB97Tlbr, TB97Ctls, TB97, fcLabel, uCtrlPadroes,
  {Alex 17.06.2005 uCtrlRad,} uCtrlEtapa, usistema, DBaseDados, FTelaAut,
  fMtExecEtapa, fMTProcPend, fMTgeraProc, fMTAcompProc, fMTAtuObjRad,
  //Rodolpho da Silva - 24/10/2006
  uCtrlRADPlus, FProcessosRAD, FGeraProcesso, uMensErro,
  CMNetUsers, DBTables, wwstorep;

type
  TfrmCMPrincipal = class(TfrmCMPrincipalForms)
    procedure mnuEtapasPendentesClick(Sender: TObject);
    procedure mnuRadPendenteClick(Sender: TObject);
    procedure mnuGerarProcesso_PadraoClick(Sender: TObject);
    procedure mnuRADConsultarClick(Sender: TObject);
    procedure mnuAtuObjetosClick(Sender: TObject);
    procedure ActExecEtapaExecute(Sender: TObject);
  private
    { Private declarations }
  protected
    // Alex - 13.06.2005 retirar o RAD do CMForms50
    procedure ListaProcessosRADPendentes; override;
  public
    { Public declarations }
  end;

var
  frmCMPrincipal: TfrmCMPrincipal;

implementation

{$R *.DFM}

{ TfrmCMPrincipal }

procedure TfrmCMPrincipal.ListaProcessosRADPendentes;
var
  iQtde,iQtdeOutros : integer;
  sMsg: string;
  
begin
  inherited;
  // Método passado para a bpl CMPrincipal feita para separar o RAD
  If Sistema.UsaRad Then
  Begin
     // Início - Rodolpho da Silva - 25/10/2006
     if (Sistema.VersaoRAD = '+') then
     begin
        with TCtrlRADPlus.Create do
        try
            InitializeAs( Padroes );
              //
            ConsultaProcessos( Sistema.IdUsuario, iQtde, iQtdeOutros );

            if iQtde > 0 then
            begin
              sMsg := 'Existe(m) ' + inttostr (iQtde) + ' processo(s) pendente(s) de sua autorização.';
              if iQtdeOutros > 0 then
              sMsg := sMsg + #13 + 'Deste(s),  ' + InttoStr (iQtdeOutros) + ' ainda aguarda(m) na fila para aprovação de outro(s) usuário(s).';
              MsgDlg(sMsg,'Aviso',mtInformation,[mbOk],0);
            end;

        finally
           Free;
        end;
     end
     else
     // Fim - Rodolpho da Silva - 25/10/2006

     begin
        With {Alex 17.06.2005 TCtrlRad} TCtrlEtapa.Create Do
          Try
            //DAVID - Pendência 16191
            //Inicializado em separado para prover exibição de mensagens do RAD.
            //InitializeAs(Padroes);
            Initialize( dtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                        Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgCtrl );

            InfoNumProcPend(Sistema.IdUsuario);
          finally
            Free;
          End;
      end;
  End;

end;

procedure TfrmCMPrincipal.mnuEtapasPendentesClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmMTExecEtapa,TfrmMTExecEtapa, false);
  frmMTExecEtapa.MostraEtapasPend(true);
end;

procedure TfrmCMPrincipal.mnuRadPendenteClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmMTProcPend, TfrmMTProcPend, false);
end;

procedure TfrmCMPrincipal.mnuGerarProcesso_PadraoClick(Sender: TObject);
begin
  inherited;
  // Rodolpho da Silva - 24/10/2006
  if (Sistema.VersaoRAD = '+') then
     AbrirForm(FrmGeraProcesso,TFrmGeraProcesso,false)
  else
     AbrirForm(frmMTgeraProc,TfrmMTgeraProc,False);
end;





procedure TfrmCMPrincipal.mnuAtuObjetosClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmMTAtuObjRad,TfrmMTAtuObjRad, false);
end;

procedure TfrmCMPrincipal.ActExecEtapaExecute(Sender: TObject);
begin
  inherited;
  if (Sistema.VersaoRAD = '+') then
  begin
     if frmProcessosRAD <> nil then
       FreeAndNil( frmProcessosRAD );
     TfrmProcessosRAD.ModoConsulta( False );
     AbrirForm(FrmProcessosRAD,TFrmProcessosRAD,false)
  end
  else
  begin
     AbrirForm( frmMTExecEtapa, TfrmMTExecEtapa, False );
     frmMTExecEtapa.MostraEtapasPend(false);
  end;
end;

procedure TfrmCMPrincipal.mnuRADConsultarClick(Sender: TObject);
begin
  inherited;
  if ( Sistema.VersaoRAD = '+' ) then
  begin
    if frmProcessosRAD <> nil then
      FreeAndNil( frmProcessosRAD );
    TfrmProcessosRAD.ModoConsulta( True );
    AbrirForm( FrmProcessosRAD, TFrmProcessosRAD, False );
  end
  else
    AbrirFormModal(frmMTAcompProc, TfrmMTAcompProc);
end;


end.
