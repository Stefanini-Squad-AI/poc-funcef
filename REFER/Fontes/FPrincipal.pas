unit FPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMPrincipal, CorreioCM, SConnect, MConnect, Db, DBClient, AppEvnts,
  CMApplicationEvents, StdActns, ActnList, ImgList, IvDictio, IvAMulti,
  IvBinDic, Menus, IvMulti, IvEMulti, fcStatusBar, wwdblook, Mask,
  wwdbedit, StdCtrls, DBCtrls, ExtCtrls, TB97Tlwn, TB97Tlbr, TB97Ctls,
  TB97, fcLabel, uSistema, uModulo, uResource, CMNetUsers;

type
  TfrmPrincipal = class(TfrmCMPrincipal)
    mnuModulo: TMenuItem;
    mnuRecebimento_Assistencial: TMenuItem;
    mnuAssistencial: TMenuItem;
    mnuFolhaBenef: TMenuItem;
    mnuContraChequeTrimestral: TMenuItem;
    mnuProcessamentos: TMenuItem;
    mnuGeraArquivoSipcCap: TMenuItem;
    procedure mnuRecebimento_AssistencialClick(Sender: TObject);
    procedure mnuContraChequeTrimestralClick(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure mnuGeraArquivoSipcCapClick(Sender: TObject);
  private
    { Private declarations }
    function EscolheFundacao : longint;


  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

Uses
  FTelaAut, FRecebimentoAssistencial, fcontrachequetrimestral, uObjFolha,
  FGeraArquivoSipcCap;

{$R *.DFM}

procedure TfrmPrincipal.mnuRecebimento_AssistencialClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmRecebimentoAssistencial, TFrmRecebimentoAssistencial, False);
end;

procedure TfrmPrincipal.mnuContraChequeTrimestralClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmContraChequeTrimestral, TFrmContraChequeTrimestral, False);
end;

procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
begin
  inherited;
  SistemaFolha := TObjSistemaFolha.Create;
end;



function TfrmPrincipal.EscolheFundacao: longint;
begin
  SistemaFolha.FundacaoCorrente := Sistema.IdEmpresa;
end;



procedure TfrmPrincipal.mnuGeraArquivoSipcCapClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmGeraArquivoSipcCap,TFrmGeraArquivoSipcCap,false);
end;

initialization
   Sistema.NomeModulo      := 'REFER';    // Nome do Módulo
   Sistema.IdModulo        := 723;        // Numero do Módulo
   Sistema.LoadOldReport   := False;      // Todos os relatorios estão para 3 camadas
   Sistema.Versao := '3.01.01';
   Sistema.NomeAplicativo  := 'REFER';    // Nome do Modulo
   Sistema.UsaLogOperacoes := True;
   Modulo                  := TModulo.Create;

finalization
   Modulo.free;
end.
