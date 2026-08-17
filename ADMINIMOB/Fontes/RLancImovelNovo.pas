{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------

Rotina......: CmeCadastroFind, sbtnProcurarClick
Nº SOL......: 196482/13524
Nº KINTANA..: 1992938
Responsável : SADI FREIRE
Data        : 31/01/2014
Descrição   : Otimização do processo de busca na consulta de lancamentos
--------------------------------------------------------------------------------
Pendência   : SOL 168332 Kintana 1482975
Responsável : Ricardo Cristiano
Data        : 16/12/2011
Descrição   : Implementação de otimização de performance na tela
              LANÇAMENTOS/CONSULTA, do sistema AdminImob, na busca do documento,
              preenchimento de tela e impressão do relatório
--------------------------------------------------------------------------------
Pendência   : 27394
Responsável : Daniel Simões
Data        : 14/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
Pendência   :
Responsável : André Pontes
Data        : 22/11/2000
Rotina      : Consulta de Lançamentos de Receitas e Despesas de Imóveis  (nova
              integração)
              obs.: Apenas consulta, consulta TODOS, baixados ou não.
Descrição   : Lógica refeita em função de alterações na Integração (IDDOCUMENTO)
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit RLancImovelNovo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  Mask, DBCtrls, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, CmEventosCadastro,
  ImgList, ComCtrls, FCadastroCSImob, wwriched
  {$IFNDEF VERSAO0505}, uCMTypes, TREdit {$ENDIF};

type
  TfrmRelLancImovelNovo = class(TfrmCadastroCSImob)
    lblRecPag: TLabel;
    lblStatus: TLabel;
    lblEstornado: TLabel;
    dsLancamentos: TwwDataSource;
    qry_ORIGEMLANC: TStringField;
    qry_MESCOMPETENCIA: TStringField;
    pgcPrincipal: TPageControl;
    tbsGeral: TTabSheet;
    Label22: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label16: TLabel;
    DBEdit3: TDBEdit;
    DBEdit6: TDBEdit;
    DBedtPortadorForma: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    tbsImovel: TTabSheet;
    DBgrdReajuste: TwwDBGrid;
    tbsMensagem: TTabSheet;
    Label15: TLabel;
    lblDataVencimento: TLabel;
    Label8: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label1: TLabel;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBedtNomeUsuario: TDBEdit;
    DBedtNomeExtenso: TDBEdit;
    DBedtOrigem: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit9: TDBEdit;
    Panel3: TPanel;
    Label13: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    DBedtLinha1: TDBEdit;
    DBedtLinha2: TDBEdit;
    DBedtLinha3: TDBEdit;
    DBedtLinha4: TDBEdit;
    DBedtLinha5: TDBEdit;
    DBedtLinha6: TDBEdit;
    DBedtLinha7: TDBEdit;
    DBedtLinha8: TDBEdit;
    DBedtLinha9: TDBEdit;
    Panel2: TPanel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label14: TLabel;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit2: TDBEdit;
    DBmemObs: TDBMemo;
    Label26: TLabel;
    Bevel1: TBevel;
    dsObs: TwwDataSource;
    dsMsg: TwwDataSource;
    tbsAlterador: TTabSheet;
    Panel1: TPanel;
    DBgrdAlteradoresDoc: TwwDBGrid;
    dsAlteradoresDoc: TwwDataSource;
    tbsAutorizacao: TTabSheet;
    Panel4: TPanel;
    wwDBGrid1: TwwDBGrid;
    dsAutorizacoes: TwwDataSource;
    wwDBRichEdit1: TwwDBRichEdit;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label27: TLabel;
    dsContaBancairia: TwwDataSource;
    DBgrdAlteradoresLanc: TwwDBGrid;
    dsAlteradoresLanc: TwwDataSource;
    DBEdit10: TDBEdit;
    DBEdit20: TDBEdit;
    Label28: TLabel;
    Label5: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    DBEdit21: TDBEdit;
    qryDESCCUSTORECIMO: TStringField;
    qrySTATUS_DOC: TStringField;
    qryPLNPLANIL: TFloatField;
    qryPLNCODIGO: TFloatField;
    qryCODDOCUMENTO: TFloatField;
    qryIDDOCUMENTO: TFloatField;
    qryFORMA_RECTOPAGTO: TStringField;
    qryTOT_ALTERADOR: TFloatField;
    qryNF_FORCLI: TStringField;
    qryRS_FORCLI: TStringField;
    qryDATALANCAMENTO: TDateTimeField;
    qryDATAVENCIMENTO: TDateTimeField;
    qryDATA_BAIXA: TDateTimeField;
    qryMESCOMPETENCIA: TFloatField;
    qryANOCOMPETENCIA: TFloatField;
    qryFLGORIGEMLANC: TStringField;
    qryFLGESTORNADO: TFloatField;
    qryFLGINTEGRADO: TFloatField;
    qryDOC_CAPCAR: TFloatField;
    qryNUMAPGR: TFloatField;
    qryNOSSONUMERO: TStringField;
    qryIDCBANCARIA: TFloatField;
    qryVALOR_DOCUMENTO: TFloatField;
    qryVALOR_TOTAL: TFloatField;
    qryRECPAG: TStringField;
    tbsCorrecao: TTabSheet;
    dsCorrecaoDoc: TwwDataSource;
    Panel5: TPanel;
    dbgCorrecaoDoc: TwwDBGrid;
    dsEvento: TwwDataSource;
    qryEvento: TwwQuery;
    qryEventoIDEVENTOIMOVEL: TFloatField;
    qryEventoCODDOCUMENTO: TFloatField;
    qryEventoEVIDATA: TDateTimeField;
    qryEventoEVICABECALHO: TStringField;
    qryEventoEVIDESCRICAO: TMemoField;
    qryEventoFLGAVISO: TStringField;
    qryEventoDIASAVISO: TFloatField;
    qryEventoUSUARIO_EXTENSO: TStringField;
    tsEventos: TTabSheet;
    Panel6: TPanel;
    wwDBGrid2: TwwDBGrid;
    wwDBRichEdit2: TwwDBRichEdit;
    Label31: TLabel;
    DBREdt_SaldoDoc: TDBRealEdit;
    Label32: TLabel;
    DBEdit22: TDBEdit;
    qryNUMRESERVA: TFloatField;
    qryLOGIN_USUARIO: TStringField;
    qryNF_USUARIO: TStringField;
    qryTRGDTINCLUSAO: TDateTimeField;

    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qryCalcFields(DataSet: TDataSet);
    procedure DBgrdReajusteCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure DBgrdReajusteTopRowChanged(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    Procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnTrazerClick(Sender: TObject);


  private { Private declarations }

    procedure ExibeStatus;


  public { Public declarations }
    iDocumento: Int64;
    procedure Seleciona;

  end;



var
  frmRelLancImovelNovo: TfrmRelLancImovelNovo;



implementation
{$R *.DFM}
uses
   uSistema, uMensErro, uDatabase, dBaseDados, dImobiliario, dLookImobiliario, uFuncoesImob,
  DMS, dLancImovel, dRelLancamento, uCMRptManager, uModuloImobiliario,FTelaAut;




procedure TfrmRelLancImovelNovo.CmeCadastroFind(Sender: TObject);
begin
   inherited;

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query principal com apenas o registro buscado
//   if dtmMS.MontaSelect1.RetornouValor then begin           // Sadi Freite - SOL 196482/13524 Ktn 1992938 - comentado
   if dtmMS.MS_Lancamento1.RetornouValor then                 // Sadi Freite - SOL 196482/13524 Ktn 1992938
      begin

//      iDocumento := StrToInt(dtmMS.MontaSelect1.ValoresChave[6]);  // Sadi Freite - SOL 196482/13524 Ktn 1992938 - comentado
      iDocumento := StrToInt(dtmMS.MS_Lancamento1.ValoresChave[6]);  // Sadi Freite - SOL 196482/13524 Ktn 1992938

      Seleciona;
   end;
end;



procedure TfrmRelLancImovelNovo.ExibeStatus;
var
   sRecPag, sStatus : string;
begin
   lblRecPag.Visible    := False;
   lblStatus.Visible    := False;
   lblEstornado.Visible := False;

   // Não Integrado
   if ( (qryCODDOCUMENTO.IsNull) and (qryPLNCODIGO.IsNull) ) then begin

      lblEstornado.Caption := 'Não Integrado';
      lblEstornado.Visible := True;

   end else begin

      // Só integrado com Contabilidade
      if (qryCODDOCUMENTO.IsNull) then begin // não integra capcar

         lblEstornado.Caption := 'Contabilizado';
         lblEstornado.Visible := True;

      end else begin

         // RecPag ---------------------------------------------------------------------------------
         sRecPag := qryRECPAG.AsString;
         if length(sRecPag) > 0 then begin

            case sRecPag[1] of
               'R':
               begin
                  lblRecPag.Caption    := 'a Receber';
                  lblRecPag.Font.Color := clNavy;
               end;

               'P':
               begin
                  lblRecPag.Caption    := 'a Pagar';
                  lblRecPag.Font.Color := clMaroon;
               end;
            end;

            lblRecPag.Visible := True;
         end;

         // Estornado ------------------------------------------------------------------------------
         if (qryFLGESTORNADO.asInteger = 1) then begin

            lblEstornado.Caption := 'Estornado';
            lblEstornado.Visible := True;

         end else begin

            lblEstornado.Visible := False;

            // Status ---------------------------------------------------------------------------------
            sStatus := qrySTATUS_DOC.AsString;

            if sStatus = '2' then begin
               lblStatus.Caption    := 'já Baixado';
               lblStatus.Font.Color := clNavy;
            end else begin
               lblStatus.Caption    := 'em Aberto';
               lblStatus.Font.Color := clMaroon;
            end;

            lblStatus.Visible := True;

         end;
      end;
   end;
end;



procedure TfrmRelLancImovelNovo.sbtnProcurarClick(Sender: TObject);
begin
 //  dtmMS.MontaSelect1.Executar;
   dtmMS.MS_Lancamento1.Executar;    // Sadi Freite - SOL 196482/13524 Ktn 1992938
//   dtmMS.MS_Lancamento.Executar;   // Sadi Freite - SOL 196482/13524 Ktn 1992938  - comentado
  CmeCadastro.Find(Self);

{FrmBuscaQuery:=TFrmBuscaQuery.create(application);
 try
 FrmBuscaQuery.showmodal;
 finally
FrmBuscaQuery.free;
end; }

   sbtnProcurar.Down := False;
   pnlFundo.Enabled  := True;
end;



procedure TfrmRelLancImovelNovo.FormShow(Sender: TObject);
begin
//Ricardo Cristiano - SOL : 167204 Kintana : 1465768 - Alteração para melhorar performance na entrada da tela
//   LimpaParametros(dtmLancImovel.qryLancImovel);
   dtmLancImovel.qryLancImovel.Close;
   qry.Close;

   // Só habilita a correção caso seja Receitas
   tbsCorrecao.TabVisible := False;

   inherited;
end;



procedure TfrmRelLancImovelNovo.qryCalcFields(DataSet: TDataSet);
var
   sOrigem : string;
begin
   Case qryMESCOMPETENCIA.asInteger of
       1: qry_MESCOMPETENCIA.asString := 'Janeiro';
       2: qry_MESCOMPETENCIA.asString := 'Fevereiro';
       3: qry_MESCOMPETENCIA.asString := 'Março';
       4: qry_MESCOMPETENCIA.asString := 'Abril';
       5: qry_MESCOMPETENCIA.asString := 'Maio';
       6: qry_MESCOMPETENCIA.asString := 'Junho';
       7: qry_MESCOMPETENCIA.asString := 'Julho';
       8: qry_MESCOMPETENCIA.asString := 'Agosto';
       9: qry_MESCOMPETENCIA.asString := 'Setembro';
      10: qry_MESCOMPETENCIA.asString := 'Outubro';
      11: qry_MESCOMPETENCIA.asString := 'Novembro';
      12: qry_MESCOMPETENCIA.asString := 'Dezembro';
   end;

   // prenche a origem do lançamento (nome extenso)
   sOrigem := qryFLGORIGEMLANC.asString;
   if sOrigem <> '' then begin
      qry_ORIGEMLANC.AsString := OrigemLancamento(sOrigem[1]);
   end else begin
      qry_ORIGEMLANC.AsString := '';
   end;
end;




procedure TfrmRelLancImovelNovo.DBgrdReajusteCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWhite;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmRelLancImovelNovo.DBgrdReajusteTopRowChanged(Sender: TObject);
begin
   inherited;
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmRelLancImovelNovo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   dtmLancImovel.qryLancImovel.Close;
   dtmLancImovel.qryLancImovel.UnPrepare;
   dtmLookImobiliario.qryLookContaBancaria.Close;
   dtmLookImobiliario.qryLookContaBancaria.UnPrepare;
   dtmLancImovel.qrySelectAlteraLanc.Close;
   dtmLancImovel.qrySelectAlteraLanc.UnPrepare;
   dtmLancImovel.qrySelectAlteraDoc.Close;
   dtmLancImovel.qrySelectAlteraDoc.UnPrepare;
   dtmLancImovel.qrySelectObsLanc.Close;
   dtmLancImovel.qrySelectObsLanc.UnPrepare;
   dtmLancImovel.qrySelectMsgLanc.Close;
   dtmLancImovel.qrySelectMsgLanc.UnPrepare;
   inherited;
end;



procedure TfrmRelLancImovelNovo.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
   inherited;

   // habilita o painel de fundo (que contém o PageControl - orelhas)
   pnlFundo.Enabled := True;
end;



procedure TfrmRelLancImovelNovo.FormCreate(Sender: TObject);
begin
   inherited;
   pgcPrincipal.ActivePageIndex := 0;
end;


procedure TfrmRelLancImovelNovo.Seleciona;
var
  _Valor : Double;
begin
   Screen.Cursor := crHourGlass;

   pgcPrincipal.ActivePage := tbsGeral;

   // qry com GROUP BY para consolidar o Principal
   with qry do begin
      LimpaParametros(qry);
      ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.idEmpresa;
      ParamByName('PIDDOCUMENTO').AsInteger     := iDocumento;
      Open;
   end;

   // dados bancários
   with dtmLookImobiliario.qryLookContaBancaria do begin
      LimpaParametros(dtmLookImobiliario.qryLookContaBancaria);
      ParamByName('PIDCBANCARIA').AsInteger := qryIDCBANCARIA.AsInteger;
      Open;
   end;

   // Observações
   with dtmLancImovel.qrySelectObsLanc do begin
      LimpaParametros(dtmLancImovel.qrySelectObsLanc);
      ParamByName('PIDDOCUMENTO').AsInteger     := iDocumento;
      Open;
   end;

   // Lançamentos (por Imóvel)
{   with dtmLancImovel.qryLancImovel do begin
      LimpaParametros(dtmLancImovel.qryLancImovel);
      ParamByName('PIDPESSOA').AsInteger        := Sistema.idEmpresa;
      ParamByName('PIDDOCUMENTO').AsInteger     := iDocumento;
      Open;
   end;}

   // Mensagem do Boleto
   with dtmLancImovel.qrySelectMsgLanc do begin
      LimpaParametros(dtmLancImovel.qrySelectMsgLanc);
      ParamByName('PIDDOCUMENTO').AsInteger     := iDocumento;
      Open;
   end;

   // Alteradores
   if qryFLGINTEGRADO.IsNull then begin                  // lançamentos integrados
      with dtmLancImovel.qrySelectAlteraDoc do begin
         LimpaParametros(dtmLancImovel.qrySelectAlteraDoc);
         ParamByName('PCODDOCUMENTO').AsInteger := iDocumento;
         Open;
         DBgrdAlteradoresDoc.BringToFront;
      end;
   end else begin                                        // lançamentos não integrados
      with dtmLancImovel.qrySelectAlteraLanc do begin
         LimpaParametros(dtmLancImovel.qrySelectAlteraLanc);
         ParamByName('PIDDOCUMENTO').AsInteger    := iDocumento;
         Open;
         DBgrdAlteradoresLanc.BringToFront;
      end;
   end;

   // Autorização / Conciliação
   with dtmLancImovel.qryConciliaDoc do begin
      LimpaParametros (dtmLancImovel.qryConciliaDoc);
      ParamByName ('PIDDOCUMENTO').AsInteger    := iDocumento;
      Open;
   end;

   // Eventos
   with qryEvento do begin
      LimpaParametros(qryEvento);
      ParamByName('PCODDOCUMENTO').AsInteger := iDocumento;
      Open;
   end;

   // Correções Diárias
   if qryRECPAG.AsString[1] = 'R' then begin
      with dtmLancImovel.qrySelectCorrecaoDoc do begin
         LimpaParametros (dtmLancImovel.qrySelectCorrecaoDoc);
         ParamByName('PCODDOCUMENTO').AsInteger := iDocumento;
         ParamByName('PIDOPERMULTA').AsInteger  := ModuloImobiliario.AdminImob.iTipoOperAtualMulta;
         ParamByName('PIDOPERJUROS').AsInteger  := ModuloImobiliario.AdminImob.iTipoOperAtualJuros;
         ParamByName('PIDOPERCM').AsInteger     := ModuloImobiliario.AdminImob.iTipoOperAtualCM;
         Open;
      end;
      tbsCorrecao.TabVisible := True;
   end else begin
      tbsCorrecao.TabVisible := False;
   end;

   // Pendência : 19262 - Marcos Ventura Topini
   // Cálculo do Saldo do Documento
   _Valor := 0;
   if qryFLGINTEGRADO.IsNull then begin // lançamentos integrados
      with dtmLancImovel.qrySelectAlteraDoc do begin
         LimpaParametros(dtmLancImovel.qrySelectAlteraDoc);
         ParamByName('PCODDOCUMENTO').AsInteger := iDocumento;
         Open;
         First;
         while not dtmLancImovel.qrySelectAlteraDoc.Eof do begin
          If qry.FieldByName('RECPAG').AsString = 'R' then
           begin
              If FieldByName('DEBCRE').AsString = 'D' then
                 _Valor := _Valor +  FieldByName('VALOR').AsFloat
              else
                 _Valor := _Valor + (FieldByName('VALOR').AsFloat) * -1;
           end
          else
           begin
              If FieldByName('DEBCRE').AsString = 'C' then
               _Valor := _Valor + FieldByName('VALOR').AsFloat
              else
               _Valor := _Valor +  (FieldByName('VALOR').AsFloat) * -1;
           end;
          next
         end;
      end;
   end
   else
     begin
      with dtmLancImovel.qrySelectAlteraLanc do begin // lançamentos não integrados
         LimpaParametros(dtmLancImovel.qrySelectAlteraLanc);
         ParamByName('PIDDOCUMENTO').AsInteger := iDocumento;
         Open;
         First;
         while not dtmLancImovel.qrySelectAlteraLanc.Eof do begin
          If qry.FieldByName('RECPAG').AsString = 'R' then
           begin
              If FieldByName('ACRESDECRES').AsString = 'D' then
                 _Valor := _Valor +  FieldByName('VALOR').AsFloat
              else
                 _Valor := _Valor + (FieldByName('VALOR').AsFloat) * -1;
           end
          else
           begin
              If FieldByName('ACRESDECRES').AsString = 'C' then
               _Valor := _Valor + FieldByName('VALOR').AsFloat
              else
               _Valor := _Valor +  (FieldByName('VALOR').AsFloat) * -1;
           end;
          next
         end;
      end;
     end;

   DBREdt_SaldoDoc.Value := Qry.FieldByName('VALOR_DOCUMENTO').AsFloat + _Valor;
   // Pendência : 19262 - Marcos Ventura Topini

   ExibeStatus;

   Screen.Cursor := crDefault;
end;

procedure TfrmRelLancImovelNovo.btnTrazerClick(Sender: TObject);
var sMsg: string;
begin
  inherited;
  if (qryIDDOCUMENTO.AsInteger <= 0)  then
  begin
     MsgDlg('Por favor selecionar o Lançamento para imprimir.', 'Informação', mtInformation, [mbok], 0);
     exit;
  end;

  TdtmRelLancamento.PrintRelLancamento(qryIDDOCUMENTO.AsInteger, -1, 1, Sistema.IdEmpresa, Sistema.IdUsuario,
         Sistema.IdModulo, '', '', 'BaseDados', Sistema.NomeEmpresa, Sistema.NomeModulo,
         sMsg, nil, cntBDE, rdtScreen, true, true, true, false, nil, false);
end;

end.
