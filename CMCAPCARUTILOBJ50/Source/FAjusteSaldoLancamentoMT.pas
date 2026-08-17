{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Contas a Pagar e Receber   }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Ajuste de Saldos causados por lançamentos com + d   }
{ duas casas decimais                                   }
{                                                       }
{ Analista Responsável: Fabio Barros                    }
{ Atualizado Em: 18/06/2001                             }
{                                                       }
{*******************************************************}

Unit FAjusteSaldoLancamentoMT;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, uCtrlParamIntegra, ComCtrls, uCmSqlParams,
  DBClient, uCMClientDataSet, Db, uCtrlAjustaSaldoLancamento;

Type
  TfrmAjusteSaldoLancamentoMT = Class(TfrmOkCancelar)
    dblcAlterador: TwwDBLookupCombo;
    Label1: TLabel;
    psb: TProgressBar;
    Label2: TLabel;
    memo: TMemo;
    stb: TStatusBar;
    Cds: TCMClientDataSet;
    SqlCds: TCMSqlParams;
    SqlAux: TCMSqlParams;
    CdsAux: TCMClientDataSet;
    SqlLancamentos: TCMSqlParams;
    CdsLancamentos: TCMClientDataSet;
    Procedure FormShow(Sender: TObject);
    Procedure bbtnConfirmarClick(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure Progresso(Args: Array Of Variant);
  private
    { Private declarations }
    CtrlAjustaSaldoLancamento: TCtrlAjustaSaldoLancamento;
  public
    { Public declarations }
  End;

Var
  frmAjusteSaldoLancamentoMT: TfrmAjusteSaldoLancamentoMT;

Implementation

Uses uMensErro, uSistema;

{$R *.DFM}

Procedure TfrmAjusteSaldoLancamentoMT.FormShow(Sender: TObject);
Begin
  Inherited;
  SqlCds.Prepare;
  SqlCds.Params[0].AsString := ParamIntegra.RecPag;
  SqlCds.Open;
End;

Procedure TfrmAjusteSaldoLancamentoMT.bbtnConfirmarClick(Sender: TObject);
Begin
  Inherited;
  CtrlAjustaSaldoLancamento.CreateThreadProgresso;
  If Not CtrlAjustaSaldoLancamento.AjustaSaldoLancamento(ParamIntegra.RecPag, Sistema.IdUsuario,
    Sistema.IdEmpresa, Sistema.IdModulo, ParamIntegra.Plano, Sistema.UsaPlanoPatro,
    ParamIntegra.IntegraContab, ParamIntegra.PartidaDobrada,
    memo.Lines.Text + ' - ' + Cds.FieldByName('DESCRICAO').AsString,
    Cds.FieldByName('CODALTERADOR').AsInteger, CtrlAjustaSaldoLancamento.ProgressFileName) Then
  Begin
    CtrlAjustaSaldoLancamento.FreeThreadProgresso;
    MsgDlg(CtrlAjustaSaldoLancamento.MessageInfo, 'Erro', mtError, [mbOk], 0)
  End
  Else
  Begin
    CtrlAjustaSaldoLancamento.FreeThreadProgresso;
    MsgDlg('Operação Concluída...', 'Information', mtInformation, [mbOk], 0);
  End;
End;

Procedure TfrmAjusteSaldoLancamentoMT.FormCreate(Sender: TObject);
Begin
  Inherited;

  CtrlAjustaSaldoLancamento := TCtrlAjustaSaldoLancamento.Create;
  CtrlAjustaSaldoLancamento.InitializeAs(ParamIntegra);
  CtrlAjustaSaldoLancamento.Progresso := Progresso;
  If ParamIntegra.RecPag = 'R' Then
  Begin
    // OBS.: Não mexi no Help Context do Contas a Receber...
    HelpContext           := 40016;
    bbtnAjuda.HelpContext := 40016;
  End
  Else
  Begin
// Daniel Simões - 25/01/2006 - Início------------------------------------------
    HelpContext           := 30007;
    bbtnAjuda.HelpContext := 30007;
// Daniel Simões - 25/01/2006 - Fim---------------------------------------------
  End;
End;

Procedure TfrmAjusteSaldoLancamentoMT.Progresso(Args: Array Of Variant);
Begin
  psb.Max := Args[1];
  psb.Position := Args[2];
  stb.SimpleText := Args[3];
  Self.Repaint;

End;

End.

