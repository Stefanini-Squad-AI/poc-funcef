{
***************************************************************************************
Nº SOL............: 265430
Nº PPM............: 1176702
Data da Alteração.: 24/11/2015
Alteração Form....: correção da lógica na verificação de dias úteis
Responsável.......: William Santana
Descrição.........: O sistema não valida finais de semana/feriados para as replicações de fluxo previsto.
**************************************************************************************
 --------------------------------------------------------------------------------------------------
Rotina......: 
Nº SOL......: 162240
Nº KINTANA..: 1378222
Data........: 12/11/2011
Responsável.: Otacilio Aquino
Descrição...: Ajustar a Rotina de fluxo de caixa
---------------------------------------------------------------------------------------------------}
unit FReplicaCadMov;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, TB97, TB97Tlbr, Db, DBTables, uCtrlMovimFluxoOrc;

type
  TfrmReplicarCadMov = class(TForm)
    Dock971: TDock97;
    TB97oKCancelar: TToolbar97;
    bbtnConfirmar: TBitBtn;
    pnlFundo: TPanel;
    qryAux: TQuery;
    rdgMeses: TRadioGroup;
    procedure rdgMesesClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    CtrlMovimFluxoOrc : TCtrlMovimFluxoOrc;

    procedure proc_ReplicarCadMov(Atividade, FluxoCaixa, LinhaFluxo, Valor, CodTipDoc, IDPlanoPrev, IDPatro: Double;
                                  CRespon, TipoRecDes, Observacao, RecPag : String; DataLanc: TDateTime);

  public
    { Public declarations }
    Atividade, FluxoCaixa, LinhaFluxo, Valor, CodTipDoc, IDPlanoPrev, IDPatro, CodRel: Double;
    CRespon, TipoRecDes, Observacao, RecPag, FlgSimulaAtivo : String;
    DataLanc: TDateTime;
  end;

var
  frmReplicarCadMov: TfrmReplicarCadMov;

implementation

{$R *.DFM}

uses dBaseDados, uMensErro, uSistema, FMovimFluxoOrcMT, uReplicarMov;

procedure TfrmReplicarCadMov.proc_ReplicarCadMov(Atividade, FluxoCaixa,
  LinhaFluxo, Valor, CodTipDoc, IDPlanoPrev, IDPatro: Double; CRespon,
  TipoRecDes, Observacao, RecPag: String; DataLanc: TDateTime);
var iMeses, I: Smallint;
    ICodigo: Integer;
    dData: TDate;

begin
  try
    if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

    iMeses  := 0;
    ICodigo := 0;

    case rdgMeses.ItemIndex of
      0 : iMeses := 1;
      1 : iMeses := 7;
      2 : iMeses := 2;
      3 : iMeses := 8;
      4 : iMeses := 3;
      5 : iMeses := 9;
      6 : iMeses := 4;
      7 : iMeses := 10;
      8 : iMeses := 5;
      9 : iMeses := 11;
      10: iMeses := 6;
      11: iMeses := 12;
    end;

    for I := 1 to iMeses do
    begin
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Text := 'SELECT CM.SEQFLUXOORCADO.NEXTVAL AS CODIGO FROM DUAL';
      qryAux.Open;
      iCodigo := qryAux.FieldByName('CODIGO').AsInteger;

      // Inclementa a quantidade de meses selecionados
      dData := IncMonth(DataLanc, I);

      //Início - William Santana - SOL 265430 PPM 1176702
      //a função 'DiasUteis.DiaUtil' já verifica feriado

     // // Se não for dia util acrescentar mais um dia
//      while (not DiasUteis.DiaUtil(Sistema.IdEmpresa, dData, True, False, False)) and
//            // Se for feriado acrescentar mais um dia
//            (not DiasUteis.Feriado(Sistema.IdEmpresa, dData, True, True)) do
//        dData := dData + 1;

    // Se não for dia util ou feriado acrescentar mais um dia
      while (not DiasUteis.DiaUtil(Sistema.IdEmpresa, dData, True, True, False)) do
        dData := dData + 1;
     //Término - William Santana - SOL 265430 PPM 1176702

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Text := 'INSERT INTO FLUXOORCADO (IDFLUXOORCADO, IDPESSOA, DATAPROGRAMADA, CODTIPRECDES, RECPAG, UNIDNEGOC, ' +
                         'CODCENTRORESPON, PRAZO, VALOR, VALOROUTRAMOEDA, IDPLANOPREV, IDPATRO, CODLINHAFLUXO, ' +
                         'OBSERVACAO, FLGSIMULAATIVO, CODREL) VALUES ' +
                         '(:IDFLUXOORCADO, :IDPESSOA, :DATAPROGRAMADA, :CODTIPRECDES, :RECPAG, :UNIDNEGOC, :CODCENTRORESPON, :PRAZO, ' +
                         ':VALOR, :VALOROUTRAMOEDA, :IDPLANPREV, :IDPATRO, :CODLINHAFLUXO, :OBSERVACAO, :FLGSIMULAATIVO, :CODREL)';
      qryAux.ParamByName('IDFLUXOORCADO').AsInteger  := iCodigo;
      qryAux.ParamByName('IDPESSOA').AsFloat         := FluxoCaixa;
      qryAux.ParamByName('DATAPROGRAMADA').AsDate    := dData;
      qryAux.ParamByName('CODTIPRECDES').AsString    := TipoRecDes;
      qryAux.ParamByName('RECPAG').AsString          := RecPag;
      qryAux.ParamByName('UNIDNEGOC').AsFloat        := Atividade;
      qryAux.ParamByName('CODCENTRORESPON').AsString := CRespon;
      qryAux.ParamByName('PRAZO').AsString           := 'M';
      qryAux.ParamByName('VALOR').AsFloat            := Valor;
      qryAux.ParamByName('VALOROUTRAMOEDA').AsFloat  := 0;
      qryAux.ParamByName('IDPLANPREV').AsFloat       := IDPlanoPrev;
      qryAux.ParamByName('IDPATRO').AsFloat          := IDPatro;
      qryAux.ParamByName('CODLINHAFLUXO').AsFloat    := LinhaFluxo;
      qryAux.ParamByName('OBSERVACAO').AsString      := Observacao;
      qryAux.ParamByName('FLGSIMULAATIVO').AsString  := FlgSimulaAtivo;
      qryAux.ParamByName('CODREL').AsFloat           := CodRel;
      qryAux.ExecSQL;
    end;

    dtmBaseDados.dbBaseDados.Commit;
    MsgDlg('Replicação efetuada com sucesso.', 'Confirmação', mtInformation, [mbOk], 0);
    frmReplicarCadMov.Close;
  except
    on E: Exception do
    begin
      dtmBaseDados.dbBaseDados.Rollback;
      MsgDlg('ERRO AO REPLICAR CADASTRO DE MOVIMENTAÇÃO. ' + E.Message, 'ERRO', mtError, [mbOk], 0);
    end;
  end;
end;

procedure TfrmReplicarCadMov.rdgMesesClick(Sender: TObject);
begin
  bbtnConfirmar.Enabled := rdgMeses.ItemIndex >= 0;

  case rdgMeses.ItemIndex of
      0 : uReplicarMov.iQtdeMesRateiro := 1;
      1 : uReplicarMov.iQtdeMesRateiro := 7;
      2 : uReplicarMov.iQtdeMesRateiro := 2;
      3 : uReplicarMov.iQtdeMesRateiro := 8;
      4 : uReplicarMov.iQtdeMesRateiro := 3;
      5 : uReplicarMov.iQtdeMesRateiro := 9;
      6 : uReplicarMov.iQtdeMesRateiro := 4;
      7 : uReplicarMov.iQtdeMesRateiro := 10;
      8 : uReplicarMov.iQtdeMesRateiro := 5;
      9 : uReplicarMov.iQtdeMesRateiro := 11;
      10: uReplicarMov.iQtdeMesRateiro := 6;
      11: uReplicarMov.iQtdeMesRateiro := 12;
  end;
end;

procedure TfrmReplicarCadMov.bbtnConfirmarClick(Sender: TObject);
begin
  if frmReplicarCadMov.Tag = 1 then
    Close
  else
    proc_ReplicarCadMov(Atividade, FluxoCaixa, LinhaFluxo, Valor, CodTipDoc, IDPlanoPrev, IDPatro,
                        CRespon, TipoRecDes, Observacao, RecPag, DataLanc );
end;

procedure TfrmReplicarCadMov.FormCreate(Sender: TObject);
begin
  //Inicializa CtrlMovimFluxoOrc
   CtrlMovimFluxoOrc := TCtrlMovimFluxoOrc.Create;
   CtrlMovimFluxoOrc.Initialize(dtmBaseDados.dbBaseDados,True);
end;

procedure TfrmReplicarCadMov.FormDestroy(Sender: TObject);
begin
  CtrlMovimFluxoOrc.Free;
end;

end.

