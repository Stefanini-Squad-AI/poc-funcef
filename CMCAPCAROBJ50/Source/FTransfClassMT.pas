{-------------------------------------------------------------------------------
Data      : 11/01/05
Analista  : Alex Pereira
Pendência : 18323
Descrição : Gerando apenas uma planilha de transferência - mostrar na tela
            Obrigando a transferência contábil, componente enabled - campo pode ser retirado daqui a 6 meses
            Obrigar o tipo de operação
------------------------------------------------------------------------------}

// Marchetti - Pendencia 16967
// Ajuste na critica do processo
// Retirada a critica de contas no metodo bbtnConfirmaClaClick. Foi colocada a critica
// no uCtrlTransfClass

(*******************************************************************************
 10/09/1999 - 02.13.06
   Alterações na largura dos combos de Tipos de Recebimento\Desembolso e Contas
   Contábeis;
 14/09/1999 - 02.13.07
   Inclusão da Razão social no histórico contábil
 15/10/1999 - 02.14.03
   Inclusão da opção da seleção dos documento pela data de vencimento ou pela
   data programada
 19/10/1999 - 02.14.04
   Inclusão da opção de sincronismoente tipo de desembolso/recebimento e contas
   contábeis: Só é realizada a transferência das contas contábeis lançadas associadas
   ao tipo de desembolso indicado
 14/02/2000 - 02.17.06
   Otimização do Formulário;
   Correção na transferência contábil;
 15/02/2000 - 02.17.07
    Correção da consutla de transferência contábil
 17/05/2000 - Alterações Funcef
    Implementação da visualização das contas sintéticas na pesquisa da conta contábil
 17/10/2002 - 3 Camadas
    Conversão para o Modelo 3 Camadas - Fábio Barros
*******************************************************************************)

unit FTransfClassMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, Buttons, TB97Tlbr, TB97,
  ExtCtrls, wwdblook, CMDBLookupCombo, Db, DBTables, 
  IvDictio, IvMulti, IvEMulti, Wwdatsrc, CMProcuraMask, StdCtrls,
  wwdbdatetimepicker, CMDateTimePicker, uCMTypes, uCtrlTransfClass, uCtrlParamIntegra,
  DBClient, uCMClientDataSet, uCmSqlParams;

type
  TfrmTransfClassMT = class(TfrmSairAjuda)
    bbtnConfirmaCla: TBitBtn;
    gbContas: TGroupBox;
    GpTipoDesemb: TGroupBox;
    dblcTipoRDOrigem: TCMDBLookupCombo;
    dblcTipoRDDestino: TCMDBLookupCombo;
    Label3: TLabel;
    Label4: TLabel;
    gbDataRef: TGroupBox;
    deDataRef: TCMDateTimePicker;
    RgData: TRadioGroup;
    CkbSinc: TCheckBox;
    dblcCCOrigem: TCMProcuraMaskContabil;
    CkbTransf: TCheckBox;
    sqlTipoRD: TCMSqlParams;
    cdsTipoRD: TCMClientDataSet;
    dsTipoO: TDataSource;
    dsTipoD: TDataSource;
    dblcCCDestino: TCMProcuraMaskContabil;
    dbLkTipOper: TCMDBLookupCombo;
    Label1: TLabel;
    gbDataAte: TGroupBox;
    deDataAte: TCMDateTimePicker;
    sqlTipOper: TCMSqlParams;
    CdsTipOper: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);

    procedure bbtnConfirmaClaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dblcTipoRDOrigemCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcTipoRDDestinoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcCCOrigemExit(Sender: TObject);
    procedure dblcCCDestinoExit(Sender: TObject);
    procedure dblcCCOrigemApertouBotao(Sender: TObject);
    procedure dblcCCDestinoApertouBotao(Sender: TObject);
    procedure CkbTransfClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    _CtrlTransfClass : TCtrlTransfClass;

  public
    { Public declarations }
  end;

var
  frmTransfClassMT: TfrmTransfClassMT;

implementation

uses uMensErro, uModulo, uSistema, uFuncaoGeral, uDataBase, dBaseDados;

{$R *.DFM}

procedure TfrmTransfClassMT.bbtnConfirmaClaClick(Sender: TObject);
var
  iPlnCodigo : Integer;
begin
  inherited;

  iPlnCodigo := _CtrlTransfClass.GravaTransfClass(dblcTipoRDOrigem.LookupValue,
                                       dblcTipoRDDestino.LookupValue,
                                       dblcCCOrigem.Conta.Numero,
                                       dblcCCDestino.Conta.Numero,
                                       ParamIntegra.RecPag,
                                       deDataAte.Text,
                                       deDataRef.Text,
                                       RgData.ItemIndex,
                                       Sistema.IDEmpresa,
                                       Sistema.IdModulo,
                                       Sistema.IdUsuario,
                                       ParamIntegra.Plano,
                                       0,
                                       (ckbSinc.State = cbChecked),
                                       gbDataRef.Enabled,
                                       ParamIntegra.IntegraContab,
                                       (CkbTransf.State = cbChecked),
                                       Sistema.UsaPlanoPatro,
                                       dbLkTipOper.LookupValue);
  if iPlnCodigo > 0 then
    MsgDlg('Transferência entre Contas Contábeis efetuada com sucesso!' + #13 +
           'Gerada a planilha interna: ' + IntToStr(iPlnCodigo), 'Informação', mtInformation, [mbOk], 0)
  else
    MsgDlg(_CtrlTransfClass.MessageInfo, 'Erro', mtError, [mbOk], 0);


end;

procedure TfrmTransfClassMT.FormActivate(Sender: TObject);
begin
  inherited;
  deDataAte.Date := (Date-1);
  if not ParamIntegra.IntegraContab then
  begin
    gbContas.Enabled  := False;
    gbDataRef.Enabled := False;
  end;
end;

procedure TfrmTransfClassMT.dblcTipoRDOrigemCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  dblcCCOrigem.Plano         := ParamIntegra.plano;
  dblcCCOrigem.DataSource    := dsTipoO;
  dblcCCOrigemExit(Self);
  dblcCCOrigem.DataSource    := nil;
end;

procedure TfrmTransfClassMT.dblcTipoRDDestinoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  dblcCCDestino.Plano      := ParamIntegra.plano;
  dblcCCDestino.DataSource := dsTipoD;
  dblcCCDestinoExit(Self);
  dblcCCDestino.DataSource := nil;
end;

procedure TfrmTransfClassMT.FormCreate(Sender: TObject);
begin
  inherited;
  _CtrlTransfClass := TCtrlTransfClass.Create;
  _CtrlTransfClass.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

  if ParamIntegra.RecPag = 'R' then
  begin
    GpTipoDesemb.Caption  := 'Transferência de Tipos de Recebimentos';
    CkbSinc.Caption       := 'Sincroniza tipos de recebimento e conta contábil de origem ';
    HelpContext           := 40007;
    bbtnAjuda.HelpContext := 40007;
  end
  else
  begin
    GpTipoDesemb.Caption  := 'Transferência de Tipos de Desembolso';
    CkbSinc.Caption       := 'Sincroniza tipos de desembolso e conta contábil de origem ';
    HelpContext           := 30005;
    bbtnAjuda.HelpContext := 30005;
  end;

  if ParamIntegra.IntegraContab Then
  begin
    dblcCCOrigem.Plano     := ParamIntegra.Plano;
    dblcCCOrigem.Mascara   := ParamIntegra.MascaraPlano;
    dblcCCDestino.Plano    := ParamIntegra.Plano;
    dblcCCDestino.Mascara  := ParamIntegra.MascaraPlano;
    CkbTransf.Enabled      := True;
    gbContas.Enabled       := True;
    deDataRef.Enabled      := True;
    sqlTipOper.Open;
    dbLkTipOper.Enabled    := true;
  end
  else
  begin
    CkbTransf.Checked := False;
    CkbTransf.Enabled := False;
    gbContas.Enabled  := True;
    deDataRef.Enabled := false;
    dbLkTipOper.Enabled := False;
  end;
  sqlTipoRD.Prepare;
  sqlTipoRD.ParamByName('pRECPAG').AsString    := ParamIntegra.RecPag;
  sqlTipoRD.ParamByName('pIDPESSOA').AsInteger := Sistema.idEmpresa;
  sqlTipoRD.Open;
end;

procedure TfrmTransfClassMT.dblcCCOrigemExit(Sender: TObject);
begin
  inherited;
  dblcCCOrigem.AceitaTipoConta := SoAnalitica;
end;

procedure TfrmTransfClassMT.dblcCCDestinoExit(Sender: TObject);
begin
  inherited;
  dblcCCDestino.AceitaTipoConta := SoAnalitica;
end;

procedure TfrmTransfClassMT.dblcCCOrigemApertouBotao(Sender: TObject);
begin
  inherited;
  dblcCCOrigem.AceitaTipoConta := Indiferente;
end;

procedure TfrmTransfClassMT.dblcCCDestinoApertouBotao(Sender: TObject);
begin
  inherited;
  dblcCCDestino.AceitaTipoConta := Indiferente;
end;

procedure TfrmTransfClassMT.CkbTransfClick(Sender: TObject);
begin
  inherited;
  if  not CkbTransf.checked then
  begin
    CkbSinc.checked := False;
    CkbSinc.enabled := False;
  end
  else begin
    CkbSinc.enabled := True;
    CkbSinc.Checked := True;  // Alex 12/01/05 18323
  end;

end;

procedure TfrmTransfClassMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  _CtrlTransfClass.Free;
end;

end.
