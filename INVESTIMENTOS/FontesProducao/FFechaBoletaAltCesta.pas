//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_3
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//*****************************************************************************
//Data	    : 06/03/2006
//Código    : Al_2
//Motivo(S) : Implementação da trava de fechamento de renda variavel
//******************************************************************************
// Data     : 24/05/2005
// Código   : AL_1
// Motivo   : Implementação do teste de período contabil em 3 camadas
//********************************************************************************************************
unit FFechaBoletaAltCesta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, ExtCtrls, Grids, DBGrids, StdCtrls, Mask, DBCtrls,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, fcLabel,
  faMensagem, wwdbdatetimepicker, CMDateTimePicker, wwdblook, Db, DBTables,
  Wwquery, Wwdbigrd, Wwdbgrid, Wwdatsrc, CMDBLookupCombo, uCtrlInvContab;

type
  TfrmFechaBoletaAltCesta = class(TfrmOkCancelarInv)
    pnlGrid: TPanel;
    pnlTitCestaAnterior: TPanel;
    Bevel1: TBevel;
    fraMsgAltCesta: TfraMensagem;
    qryCestaAtual: TwwQuery;
    qryCestaAnterior: TwwQuery;
    qryCestaAtualIDCESTAOPCIND: TFloatField;
    qryCestaAtualDATAVIGENCIA: TDateTimeField;
    qryCestaAtualDESCINVESTIMENTO: TStringField;
    qryCestaAtualQUANTIDADE: TFloatField;
    qryCestaAtualIDCARTEIRAINVEST: TFloatField;
    qryCestaAtualIDINVESTIMENTO: TFloatField;
    qryCestaAtualIDEMISSOR: TFloatField;
    qryCestaAtualIDCUSTODIANTE: TFloatField;
    dbgTransferencias: TwwDBGrid;
    qryCestaAnteriorIDCESTAOPCIND: TFloatField;
    qryCestaAnteriorDATAVIGENCIA: TDateTimeField;
    qryCestaAnteriorDESCINVESTIMENTO: TStringField;
    qryCestaAnteriorQUANTIDADE: TFloatField;
    qryCestaAnteriorIDCARTEIRAINVEST: TFloatField;
    qryCestaAnteriorIDINVESTIMENTO: TFloatField;
    qryCestaAnteriorIDEMISSOR: TFloatField;
    qryCestaAnteriorIDCUSTODIANTE: TFloatField;
    qryBuscaDatas: TwwQuery;
    qryTransfCesta: TwwQuery;
    dsTransfCesta: TwwDataSource;
    qryTransfCestaDESCINVESTIMENTO: TStringField;
    qryTransfCestaSGLCUSTODIANTE: TStringField;
    qryTransfCestaIDCUSTODIANTE: TFloatField;
    qryTransfCestaIDINVESTIMENTO: TFloatField;
    qryTransfCestaQTDANT: TFloatField;
    qryTransfCestaQTDATU: TFloatField;
    qryTransfCestaDIF: TFloatField;
    qryTransfCestaIDEMISSOR: TFloatField;
    qryTransfCestaIDCARTEIRAINVEST: TFloatField;
    lblData: TfcLabel;
    pnlDatas: TPanel;
    qryBuscaDatasDATAVIGENCIA: TDateTimeField;
    dblDataVigencia: TCMDBLookupCombo;
    Label1: TLabel;
    qryUpdBoletaCesta: TwwQuery;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure dblDataVigenciaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFechaBoletaAltCesta: TfrmFechaBoletaAltCesta;

implementation

uses UBibliotecaInvest, UOperComum, UOpcaoIndice, UMensErro, DBaseDados,UDataBase,
     dOpcoesIndice, dRendaVariavel, URendaVariavel;

{$R *.DFM}

procedure TfrmFechaBoletaAltCesta.FormShow(Sender: TObject);
begin
   inherited;
   OperComum.LimpaParametros(qryBuscaDatas);
   qryBuscaDatas.ParamByName('DATAVIGENCIA').AsString := DateToStr(pRPI.DATAULTFECH);
   qryBuscaDatas.Open;
   dblDataVigencia.Text := qryBuscaDatasDATAVIGENCIA.AsString;
   dblDataVigencia.PerformSearch;

   if not qryBuscaDatas.Eof then
      lblData.Caption := 'Dia ' + qryBuscaDatasDATAVIGENCIA.AsString
   else
      lblData.Caption := '';

   OperComum.LimpaParametros(qryTransfCesta);
   qryTransfCesta.ParamByName('DATAVIGENCIA').AsString := qryBuscaDatasDATAVIGENCIA.AsString;
   qryTransfCesta.Open;

   if qryTransfCesta.IsEmpty then
      bbtnConfirmar.Enabled := False
   else
      bbtnConfirmar.Enabled := True;

   fraMsgAltCesta.Apaga;
end;

procedure TfrmFechaBoletaAltCesta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   qryTransfCesta.Close;
   qryBuscaDatas.Close;
   inherited;
end;

procedure TfrmFechaBoletaAltCesta.bbtnConfirmarClick(Sender: TObject);
var iIdHistCartInvDest,iCarteiraOrig,iCarteiraDest,iMotBloqOrig,iMotBloqDest,
    iMercadoOrig, iMercadoDest, iPlanilha : Integer;
    sBoleta, sMsg: String;
    fQtdTransf: Double;

begin
   // AL_2
   if RendaVariavel.VerEmAbertura then
      Exit;

   inherited;
   // Inicia o processo das transferências das Alterações de Cestas
   try
      try
         if not DtmBaseDados.dbBaseDados.InTransaction then
            DtmBaseDados.dbBaseDados.StartTransaction;

         // AL_1
         //AL_3
         if not CtrlInvContab.TestaPeriodo(qryBuscaDatasDATAVIGENCIA.AsString,2, 8) then
            Raise Exception.Create(CtrlInvContab.MessageInfo);


         sBoleta := 'OI-' + Copy(qryBuscaDatasDATAVIGENCIA.AsString,9,2) + '/' +
                            FormatFloat('0000', LeUltRegistro(Nil,'CONTDOCRENVAR' +
                            Copy(qryBuscaDatasDATAVIGENCIA.AsString,9,2)));

         OperComum.LimpaParametros(DMOpcoesIndice.qryInsBoletaOpcInd, True);
         DMOpcoesIndice.qryInsBoletaOpcInd.ParamByName('IDBOLETA').AsString := sBoleta;
         DMOpcoesIndice.qryInsBoletaOpcInd.ParamByName('STATUS').AsString := 'P';
         DMOpcoesIndice.qryInsBoletaOpcInd.ParamByName('DATABOLETA').AsDateTime := qryBuscaDatasDATAVIGENCIA.AsDateTime;
         DMOpcoesIndice.qryInsBoletaOpcInd.ParamByName('TIPMOVBOLETA').AsString := 'TRC';
         DMOpcoesIndice.qryInsBoletaOpcInd.ExecSQL;

         fraMsgAltCesta.Mostra;
         fraMsgAltCesta.Max := qryTransfCesta.RecordCount;
         fraMsgAltCesta.Pos := 0;
         qryTransfCesta.First;
         while not qryTransfCesta.Eof do
         begin
            if qryTransfCestaDIF.AsFloat > 0 then
            begin
               // Transfere para Carteira a Vista
               fraMsgAltCesta.Mes := sMsg + 'Transferindo ' + qryTransfCestaDESCINVESTIMENTO.AsString + #13 +
                                            'para a Carteira a Vista';
               iCarteiraOrig := pRPI.IDCARTOPCIND;
               iCarteiraDest := qryTransfCestaIDCARTEIRAINVEST.AsInteger;
               iMotBloqOrig  := pRPI.IDMOTBLOQOPC;
               iMotBloqDest  := -1;
               iMercadoOrig  := 3;
               iMercadoDest  := 1;
            end
            else
            begin
               // Transfere para a Carteira de Opcoes
               fraMsgAltCesta.Mes := sMsg + 'Transferindo ' + qryTransfCestaDESCINVESTIMENTO.AsString + #13 +
                                            'para a Carteira de Opções';
               iCarteiraOrig := qryTransfCestaIDCARTEIRAINVEST.AsInteger;
               iCarteiraDest := pRPI.IDCARTOPCIND;
               iMotBloqOrig  := -1;
               iMotBloqDest  := pRPI.IDMOTBLOQOPC;
               iMercadoOrig  := 1;
               iMercadoDest  := 3;
            end;

            // Verifica se já existe Planilha gravada na boleta e utiliza a mesma.
            OperComum.LimpaParametros(DMRendaVariavel.qryBoleta);
            DMRendaVariavel.qryBoleta.ParamByName('IDBOLETA').AsString := sBoleta;
            DMRendaVariavel.qryBoleta.Open;
            if (not DMRendaVariavel.qryBoleta.IsEmpty) and
               (not DMRendaVariavel.qryBoletaPLNCODIGO.IsNull) then
               iPlanilha := DMRendaVariavel.qryBoletaPLNCODIGO.AsInteger
            else
               iPlanilha := -1;

            if not OperComum.TransfEntreCarteiras(qryTransfCestaIDEMISSOR.AsInteger,
                                                  iCarteiraOrig,iCarteiraDest,
                                                  qryTransfCestaIDINVESTIMENTO.AsInteger,
                                                  qryTransfCestaIDCUSTODIANTE.AsInteger,
                                                  qryTransfCestaIDCUSTODIANTE.AsInteger,
                                                  iMotBloqOrig,iMotBloqDest,iMercadoOrig,iMercadoDest,
                                                  qryTransfCestaIDEMISSOR.AsInteger,
                                                  Abs(qryTransfCestaDIF.AsFloat),
                                                  Abs(qryTransfCestaDIF.AsFloat),
                                                  qryBuscaDatasDATAVIGENCIA.AsDateTime,
                                                  False,'', sBoleta, iIdHistCartInvDest,-1,iPlanilha) then
               Raise Exception.Create('Erro ao transferir ' + qryTransfCestaDESCINVESTIMENTO.AsString);

            qryTransfCesta.Next;
            fraMsgAltCesta.Incrementa;
         end;

         // Atualiza a Boleta nos registros da Vigencia desta Cesta
         try
            OperComum.LimpaParametros(qryUpdBoletaCesta, True);
            qryUpdBoletaCesta.ParamByName('DATAVIGENCIA').AsString := qryBuscaDatasDATAVIGENCIA.AsString;
            qryUpdBoletaCesta.ParamByName('IDBOLETA').AsString := sBoleta;
            qryUpdBoletaCesta.ExecSQL;
         except
            Raise Exception.Create('Erro na Atualização da Boleta na Vigência das Cestas');
         end;

         bbtnConfirmar.Enabled := False;
         DtmBaseDados.dbBaseDados.Commit;
         MsgDlg('Processamento concluído com sucesso.','Mensagem do Sistema ',mtConfirmation,[mbOK],0);
      except
         on E: Exception do
         begin
            DtmBaseDados.dbBaseDados.Rollback;
            MsgDlg('Ocorreu problema no Fechamento da Alteração de Cesta.'+''#13+
                   E.Message,'Mensagem do Sistema ',mtError,[mbOK],0);
         end;
      end;
   finally
      OperComum.LimpaParametros(DMRendaVariavel.qryBoleta);
      fraMsgAltCesta.Apaga;
      lblData.Caption := 'Dia: ' + qryBuscaDatasDATAVIGENCIA.AsString + ' Boleta: ' + sBoleta;
   end;
end;


procedure TfrmFechaBoletaAltCesta.FormCreate(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;
end;

procedure TfrmFechaBoletaAltCesta.FormResize(Sender: TObject);
begin
  inherited;
  fraMsgAltCesta.Width := TB97oKCancelar.Left;
end;

procedure TfrmFechaBoletaAltCesta.dblDataVigenciaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

   lblData.Caption := 'Dia ' + dblDataVigencia.Text;

   If dblDataVigencia.Text <> '' Then
   begin
      OperComum.LimpaParametros(qryTransfCesta);
      qryTransfCesta.ParamByName('DATAVIGENCIA').AsString := dblDataVigencia.Text;
      qryTransfCesta.Open;
   end
   else
      qryTransfCesta.Close;

   if qryTransfCesta.IsEmpty then
      bbtnConfirmar.Enabled := False
   else
      bbtnConfirmar.Enabled := True;

end;

End.

