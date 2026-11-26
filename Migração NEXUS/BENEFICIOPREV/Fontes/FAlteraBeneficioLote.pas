//------------------------------------------------------------------------------
//N. Atender....: WO8602
//Dt Alteração..: 04/06/2024
//Responsável...: Luis Ferrari
//Descrição.....: Importação de planilha Excel com o rateio por planos de benefícios dos imóveis da FUNCEF.
//-------------------------------------------------------------------------------
//SIG         : 101440
//Autor       : Luis Ferrari 
//Data        : 24/07/2023
//Descrição   : Importação Alteração de Valor do Benefício em Lote.
//--------------------------------------------------------------------------------
unit FAlteraBeneficioLote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, IvDictio, UAdmPrev,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,MontaSelect, DBTables, Db, ucmfileutils,
  Wwquery, Wwdatsrc, UImportaArquivoNovo, uCMTypes, ComObj, UFuncoesUteis, UDataBase, DBaseDados;  //WO8602

type
  TfrmAlteraBeneficioLote = class(TfrmOkCancelar)
    gbxAcaoLote: TGroupBox;
    pcGrid: TPageControl;
    tbImportados: TTabSheet;
    tbResultado: TTabSheet;
    dbGridValorBenefImport: TwwDBGrid;
    memResultado: TMemo;
    edtArquivo: TEdit;
    bbtnBuscaArquivo: TBitBtn;
    odAbreArq: TOpenDialog;
    qryDet: TwwQuery;
    qryAux: TwwQuery;
    btnValida: TBitBtn;
    dsImportado: TwwDataSource;
    qryImportado: TwwQuery;
    qryMaster: TwwQuery;
    updImportado: TUpdateSQL;
    Dock973: TDock97;
    Toolbar972: TToolbar97;
    ToolbarSep9711: TToolbarSep97;
    ToolbarSep973: TToolbarSep97;
    ToolbarSep974: TToolbarSep97;
    btnSelTudo: TBitBtn;
    btnInverte: TBitBtn;
    qryBenefBfciario: TwwQuery;
    qryImportadoDet: TwwQuery;
    procedure bbtnBuscaArquivoClick(Sender: TObject);
    procedure btnValidaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnInverteClick(Sender: TObject);
    procedure dbGridValorBenefImportDblClick(Sender: TObject);
    procedure btnSelTudoClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dbGridValorBenefImportDrawDataCell(Sender: TObject;
      const Rect: TRect; Field: TField; State: TGridDrawState);
  private
    { Private declarations }
    lIdPessoa,lIdPessJur,lIdPlanoPrev,liSeqProposta : integer;
    vColunasArq  : TArrayStr;
    vColunaTipo  : TArrayTipo;
    vColunaOpcao : TArrayOpcao;
    vDadosProntos : TArrayImportaBenef;
    iNumeroTotal : Integer;
    iNumeroOK : Integer;
    vHash : string;
    idCalculo  : Integer;

    procedure ValidaArquivo(var iNumFalhas : integer; var iNumOK :Integer; var vDadosProntos : TArrayImportaBenef);

  public
    { Public declarations }
    qtCk:Integer;
  end;

var
  frmAlteraBeneficioLote: TfrmAlteraBeneficioLote;

implementation

uses UMensErro, UBeneficio ;

const
  MsgProcessar = 'Deseja processar os dados do arquivo selecionado.'; // Msg001



{$R *.DFM}

{ TfrmAlteraBeneficioLote }

procedure TfrmAlteraBeneficioLote.ValidaArquivo(var iNumFalhas : integer; var iNumOK :Integer; var vDadosProntos: TArrayImportaBenef);
var
  Excel, oSheet : Variant;
  iLinha, iCol  : integer;
  sCampo        : string;
  TipoColuna    : TTipoDado;
  TipoOpcao     : TOpcaoColuna;
  sValor        : string;
  sPreparo      : integer;
  sAnoMesVig    : string;
  DadosImportacao : TRecDadosBenef;
  bErro         : boolean;
  sMensagem     : string;
  iSheet        : Integer;    //Ferrari-WO8602
begin
  inherited;


  Screen.Cursor := crHourGlass;

  memResultado.Clear;

  // definindo numero de colunas do arquivo e cabeçalho
  SetLength(vColunasArq, 9);
  for iCol := Low(vColunasArq) to High(vColunasArq) do
  begin
    case iCol of
      0 : sCampo := 'Matrícula';
      1 : sCampo := 'Número de Processo';
      2 : sCampo := 'Valor do SRB';
      3 : sCampo := 'Valor Atual BS';
      4 : sCampo := 'Valor Atual FAB';
      5 : sCampo := 'Valor Atual';
      6 : sCampo := 'Valor Total BS';
      7 : sCampo := 'Valor Total FAB';
      8 : sCampo := 'Valor Total';
    end;
    vColunasArq[iCol] := AnsiUpperCase(sCampo);
  end;

  // definindo o tipo das colunas
  SetLength(vColunaTipo, 9);
  for iCol := Low(vColunaTipo) to High(vColunaTipo) do
  begin
    case iCol of
          0,2,3,4,6,7 : TipoColuna := tdString;
                    1 : TipoColuna := tdInteger;
                  5,8 : TipoColuna := tdReal;
    end;
    vColunaTipo[iCol] := TipoColuna;
  end;

  // definindo a obrigatoriedade das colunas
  SetLength(vColunaOpcao, 9);
  for iCol := Low(vColunaOpcao) to High(vColunaOpcao) do
  begin
    case iCol of
      0,1,5,8: TipoOpcao := ocObrigatoria ;
       else  TipoOpcao := ocOpcional;
    end;
    vColunaOpcao[iCol] := TipoOpcao;
  end;

  // Cria o objeto
  Excel := CreateOleObject('Excel.application');
  Excel.Visible := False;
  // Abre o Arquivo
  Excel.WorkBooks.Open(ExpandUNCFileName(odAbreArq.FileName),1);

  // Indica a partir de qual linha começar a pegar os registros
  iLinha := 2;

  try
     // Valida o layout do arquivo excel
     if ValidaLayout(Excel, vColunasArq) then
     begin
       memResultado.Lines.Add('Resultado Validação do Arquivo de Importação:') ;
       memResultado.Lines.Add(edtArquivo.text) ;
       memResultado.Lines.Add('') ;
       memResultado.Lines.Add('Matrícula - Processo - Status') ;

       if UltimaLinha(Excel, iLinha, 11, length(vColunasArq)) then
       begin
         memResultado.Lines.Add('O arquivo selecionado não possui informações.') ;
         inc(iNumFalhas);
       end
       else
       begin

         while not UltimaLinha(Excel, iLinha, 11, length(vColunasArq)) do
         begin
           //zerando valores
           DadosImportacao.sMatricula   := '';
           DadosImportacao.iProcesso    := -1;
           DadosImportacao.dVlrSRB      := -1;
           DadosImportacao.dVlrAtualBS  := -1;
           DadosImportacao.dVlrAtualFAB := -1;
           DadosImportacao.dVlrAtual    := -1;
           DadosImportacao.dVlrTotalBS  := -1;
           DadosImportacao.dVlrTotalFAB := -1;
           DadosImportacao.dVlrTotal    := -1;
           iSheet := 1;                         //Ferrari-WO8602
           // validando o tipo de dado das colunas e preenchimento
           for iCol := Low(vColunasArq) to High(vColunasArq) do
           begin

             if ValidaDadosColunaExcel(iLinha, iCol+1, Excel, vColunasArq[iCol], vColunaTipo[iCol], vColunaOpcao[iCol], memResultado, iSheet) then   //Ferrari-WO8602
             begin

               sValor := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[iLinha, iCol+1].Value));

               // valida regras especificas do campo
               case iCol of
                 0 : begin
                       // Validando a MATRICULA
                       qryAux.Close;
                       qryAux.SQL.Clear;
                       qryAux.SQL.Add('SELECT DP.MATRICULA ');
                       qryAux.SQL.Add('FROM CM.DEPENTIT DP ');
                       qryAux.SQL.Add('WHERE DP.MATRICULA = ' + QuotedStr(sValor));
//                       qryAux.SQL.Add('AND BF.IDSITBENEFICIO = 1 ');
                       qryAux.Open;

                       if qryAux.IsEmpty then
                       begin
                         memResultado.Lines.Add(sValor + '    ' + Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[iLinha, 2].Value))+ '  Matrícula não foi localizado na base de dados..') ;
                         inc(iNumFalhas);
                         DadosImportacao.sMatricula:= '';
                       end
                       else
                         DadosImportacao.sMatricula := qryAux.Fields[0].AsString;
                     end;
                 1 : begin
                       //Validando numero de processo
                       qryAux.Close;
                       qryAux.SQL.Clear;
                       qryAux.SQL.Add('SELECT BF.NUMEROPROCESSO ');
                       qryAux.SQL.Add('FROM CM.BENEFBFCIARIO BF ');
                       qryAux.SQL.Add('WHERE BF.NUMEROPROCESSO = ' + QuotedStr(sValor));
               //        qryAux.SQL.Add('AND BF.IDSITBENEFICIO = 1 ');
                       qryAux.Open;

                       if qryAux.IsEmpty then
                       begin
                         memResultado.Lines.Add(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[iLinha, 1].Value))+ '    ' + sValor+ '  Numero de Processo não foi localizado na base de dados..') ;
                         inc(iNumFalhas);
                         DadosImportacao.iProcesso := -1;
                       end
                       else
                         DadosImportacao.iProcesso := qryAux.Fields[0].AsInteger;

                       //Validando numero de processo com Matricula
                       if not qryAux.IsEmpty then
                       begin
                         qryAux.Close;
                         qryAux.SQL.Clear;
                         qryAux.SQL.Add('SELECT BF.*,');
                         qryAux.SQL.Add('CASE WHEN BF.IDPLANPREVCONTAB = 28 AND ');
                         qryAux.SQL.Add('TRUNC(BF.DataInicioFUND) >= ''01/09/2006'' ');
                         qryAux.SQL.Add('THEN 1 ');
                         qryAux.SQL.Add('ELSE 0 END AS FLGOBRIGA_BS_FAB ');
                         qryAux.SQL.Add('FROM CM.BENEFBFCIARIO BF ');
                         qryAux.SQL.Add('JOIN CM.DEPENTIT DP ');
                         qryAux.SQL.Add('  ON DP.IDTITULAR = BF.IDTITULAR ');
                         qryAux.SQL.Add('  AND DP.IDPESSOA  = BF.IDPESSOA ');
                         qryAux.SQL.Add('WHERE BF.NUMEROPROCESSO = ' + QuotedStr(sValor));
                         qryAux.SQL.Add('   AND DP.MATRICULA   = '+QuotedStr(DadosImportacao.sMatricula));
                  //       qryAux.SQL.Add('AND BF.IDSITBENEFICIO = 1 ');
                         qryAux.Open;

                         if qryAux.IsEmpty then
                         begin
                           memResultado.Lines.Add(DadosImportacao.sMatricula + '    ' + sValor + '  Não existe associação de Matricula e Numero de Processo.');
                           inc(iNumFalhas);
                           DadosImportacao.iProcesso := -1;
                           DadosImportacao.sMatricula:= '';
                         end
                         else
                           DadosImportacao.iProcesso := qryAux.Fields[0].AsInteger;
                       end;
                     end;
                 2 : begin
                       // Validando o VlrSRB
                       if  sValor = '' then sValor := '0';
                       DadosImportacao.dVlrSRB := StrToFloat(sValor);
                     end;
                 3 : begin
                       // Validando o Valor Atual BS
                       if  sValor = '' then
                       begin
                         if (not qryAux.IsEmpty) and (qryAux.FieldByName('FLGOBRIGA_BS_FAB').AsInteger = 1) then
                         begin
                           memResultado.Lines.Add(DadosImportacao.sMatricula + '    ' + IntToStr(DadosImportacao.iProcesso) +
                           '  Faltam dados obrigatórios na ' + Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[1, iCol+1].Value)));
                           inc(iNumFalhas);
                           DadosImportacao.dVlrAtualBS := -1;
                         end
                         else
                         begin
                           sValor := '0';
                           DadosImportacao.dVlrAtualBS := StrToFloat(sValor);
                         end;
                       end
                       else
                         DadosImportacao.dVlrAtualBS := StrToFloat(sValor);
                     end;
                 4 : begin
                       // Validando o Valor Atual FAB
                       if  sValor = '' then
                       begin
                         if (not qryAux.IsEmpty) and (qryAux.FieldByName('FLGOBRIGA_BS_FAB').AsInteger = 1) then
                         begin
                           memResultado.Lines.Add(DadosImportacao.sMatricula + '    ' + IntToStr(DadosImportacao.iProcesso) +
                           '  Faltam dados obrigatórios na ' + Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[1, iCol+1].Value)));
                           inc(iNumFalhas);
                           DadosImportacao.dVlrAtualFAB := -1;
                         end
                         else
                         begin
                           sValor := '0';
                           DadosImportacao.dVlrAtualFAB := StrToFloat(sValor);
                         end;
                       end
                       else
                         DadosImportacao.dVlrAtualFAB := StrToFloat(sValor);
                     end;
                 5 : begin
                       // Validando o Valor Atual
                       if (not qryAux.IsEmpty) and (qryAux.FieldByName('FLGOBRIGA_BS_FAB').AsInteger = 1) then
                       begin
                         if (StrToFloat(sValor) - (DadosImportacao.dVlrAtualFAB + DadosImportacao.dVlrAtualBS)) > 0.02 then
                         begin
                           memResultado.Lines.Add(DadosImportacao.sMatricula + '    ' + IntToStr(DadosImportacao.iProcesso) +
                           '  Valores divergentes no ' + Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[1, iCol+1].Value)));
                           inc(iNumFalhas);
                           DadosImportacao.dVlrAtual := -1;
                         end
                         else
                           DadosImportacao.dVlrAtual := StrToFloat(sValor);
                       end
                       else
                         DadosImportacao.dVlrAtual := StrToFloat(sValor);
                     end;
                 6 : begin
                       // Validando o Valor Total BS
                       if  sValor = '' then sValor := '0';
                       DadosImportacao.dVlrTotalBS := StrToFloat(sValor);
                     end;
                 7 : begin
                       // Validando o Valor Total FAB
                       if  sValor = '' then sValor := '0';
                       DadosImportacao.dVlrTotalFAB := StrToFloat(sValor);
                     end;
                 8 : begin
                       // Validando o Valor Total
                       if (not qryAux.IsEmpty) and (qryAux.FieldByName('FLGOBRIGA_BS_FAB').AsInteger = 1) then
                       begin
                         if (StrToFloat(sValor) - (DadosImportacao.dVlrTotalBS + DadosImportacao.dVlrTotalFAB)) > 0.02 then
                         begin
                           memResultado.Lines.Add(DadosImportacao.sMatricula + '    ' + IntToStr(DadosImportacao.iProcesso) +
                           '  Valores divergentes no ' + Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[1, iCol+1].Value)));
                           inc(iNumFalhas);
                           DadosImportacao.dVlrTotal := -1;
                         end
                         else
                           DadosImportacao.dVlrTotal := StrToFloat(sValor);
                       end
                       else
                         DadosImportacao.dVlrTotal := StrToFloat(sValor);
                     end;
               end;
             end;
           end;

           // verifica se dados preenchidos corretamente para importacao
           if (DadosImportacao.sMatricula <> '')    and (DadosImportacao.iProcesso <> -1)  and
              (DadosImportacao.dVlrSRB <> -1) and (DadosImportacao.dVlrAtualBS <> -1)   and (DadosImportacao.dVlrAtualFAB <> -1)   and
              (DadosImportacao.dVlrAtual <> -1)  and (DadosImportacao.dVlrTotalBS <> -1)  and
              (DadosImportacao.dVlrTotalFAB <> -1) and (DadosImportacao.dVlrTotal <> -1) then
           begin
              memResultado.Lines.Add(DadosImportacao.sMatricula + '    ' + IntToStr(DadosImportacao.iProcesso) + '  Registro OK...') ;
              inc(iNumOK);

               setlength(vDadosProntos, high(vDadosProntos)+2);

               vDadosProntos[high(vDadosProntos)].sMatricula   := DadosImportacao.sMatricula ;
               vDadosProntos[high(vDadosProntos)].iProcesso    := DadosImportacao.iProcesso;
               vDadosProntos[high(vDadosProntos)].dVlrSRB      := DadosImportacao.dVlrSRB;
               vDadosProntos[high(vDadosProntos)].dVlrAtualBS  := DadosImportacao.dVlrAtualBS;
               vDadosProntos[high(vDadosProntos)].dVlrAtualFAB := DadosImportacao.dVlrAtualFAB;
               vDadosProntos[high(vDadosProntos)].dVlrAtual    := DadosImportacao.dVlrAtual;
               vDadosProntos[high(vDadosProntos)].dVlrTotalBS  := DadosImportacao.dVlrTotalBS;
               vDadosProntos[high(vDadosProntos)].dVlrTotalFAB := DadosImportacao.dVlrTotalFAB;
               vDadosProntos[high(vDadosProntos)].dVlrTotal    := DadosImportacao.dVlrTotal;
               vDadosProntos[high(vDadosProntos)].dVlrSRBANT      := qryAux.fieldbyname('VALORSRB').AsFloat ;
               vDadosProntos[high(vDadosProntos)].dVlrAtualBSANT  := qryAux.fieldbyname('VLRBSATUAL').AsFloat ;
               vDadosProntos[high(vDadosProntos)].dVlrAtualFABANT := qryAux.fieldbyname('VLRFABATUAL').AsFloat ;
               vDadosProntos[high(vDadosProntos)].dVlrAtualANT    := qryAux.fieldbyname('VALORATUAL').AsFloat ;
               vDadosProntos[high(vDadosProntos)].dVlrTotalBSANT  := qryAux.fieldbyname('VLRBSTOTAL').AsFloat ;
               vDadosProntos[high(vDadosProntos)].dVlrTotalFABANT := qryAux.fieldbyname('VLRFABTOTAL').AsFloat ;
               vDadosProntos[high(vDadosProntos)].dVlrTotalANT    := qryAux.fieldbyname('VALORTOTAL').AsFloat ;
               vDadosProntos[high(vDadosProntos)].iIdTitular      := qryAux.fieldbyname('IdTitular').AsInteger ;
               vDadosProntos[high(vDadosProntos)].iIdPessoa       := qryAux.fieldbyname('IdPessoa').AsInteger ;
               vDadosProntos[high(vDadosProntos)].iIdPessJur      := qryAux.fieldbyname('IdPessJur').AsInteger ;
               vDadosProntos[high(vDadosProntos)].iIdPlanoPrev    := qryAux.fieldbyname('IdPlanoPrev').AsInteger ;
               vDadosProntos[high(vDadosProntos)].iSeqProposta    := qryAux.fieldbyname('SeqProposta').AsInteger ;

           end;
           // Contador de linha
           inc(iLinha);
         end;
       end;

       memResultado.Lines.Add('------------------------------------------------------------------');
       memResultado.Lines.Add('Total de inconsistências...: '+IntToStr(iNumFalhas));
       memResultado.Lines.Add('Total de registros OK......: '+IntToStr(iNumOK));
       memResultado.Lines.Add('Total de registros Planilha: '+IntToStr(iLinha-12));  //tira o cabeçalho e as 11 linhas de final da planilha
       iNumeroTotal := (iLinha-12);
       iNumeroOK := iNumOK;
     end
     else
     begin
       MsgDlg('Arquivo não está no formato válido.', 'Atenção', mtInformation, [mbOk], 0);
     end;

  finally
     Excel.ActiveWorkBook.Saved:= 1;
     Excel.DisplayAlerts:= 0;
     Excel.ActiveWorkBook.Close(SaveChanges:= 0);
     Excel.Workbooks.Close;
     Excel.Quit;
     Excel := Unassigned;
     Screen.Cursor := crDefault;
  end;

end;

procedure TfrmAlteraBeneficioLote.bbtnBuscaArquivoClick(Sender: TObject);
begin
  inherited;
  if odAbreArq.Execute then
  begin
    edtArquivo.text := ExtractFileName( odAbreArq.FileName );
    if odAbreArq.FileName = '' then
      exit;
    vHash := GetCRC32(edtArquivo.text);
    if (qryImportado.Locate('HASHARQUIVO',vHash,[])) then
      begin
        MsgDlg('Arquivo já Importado', 'Atenção', mtInformation, [mbOk], 0);
        edtArquivo.text := '';
        Exit;
      end;
    btnValida.enabled := true;
    pcGrid.ActivePage := tbResultado;

    btnValidaclick(Sender);
  end;

end;

procedure TfrmAlteraBeneficioLote.btnValidaClick(Sender: TObject);
var
  bHabImporta   : boolean;
  iNumFalhas,iNumOK    : integer;
begin

  iNumFalhas := 0;
  iNumOK := 0;
  setlength(vDadosProntos, 0);

  ValidaArquivo(iNumFalhas,iNumOK, vDadosProntos);
  bbtnConfirmar.Enabled := (length(vDadosProntos) > 0)

end;

procedure TfrmAlteraBeneficioLote.FormShow(Sender: TObject);
begin
  inherited;
  qryImportado.Close;
  qryImportado.Open;
  if (qryImportado.isempty) then
  begin
    btnSelTudo.Enabled:=False;
    btnInverte.Enabled:=False;
  end
  else
  begin
    btnSelTudo.Enabled:=True;
    btnInverte.Enabled:=True;
  end;
  qryDet.Close;
  qryDet.Open;
  bbtnConfirmar.Enabled := False;
  bbtnCancelar.Enabled := False;
  btnValida.Enabled := False;
  qtCk:=0;
end;

procedure TfrmAlteraBeneficioLote.bbtnConfirmarClick(Sender: TObject);
var
  iIDLOTEIMPORTA : Integer;
  i      : integer;
  sSQL : string;
begin
  inherited;

  qryMaster.Close;
  qryMaster.sql.clear;
  qryMaster.SQL.Add('SELECT NVL(MAX(IDLOTEIMPORTA),0)+1 FROM CM.HSTARQUIVOALTBENEF ');
  qryMaster.Open;

  iIDLOTEIMPORTA := qryMaster.Fields[0].AsInteger;
  try
    if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;
    try
      qryMaster.Close;
      qryMaster.sql.clear;
      qryMaster.SQL.Add('Insert into CM.HSTARQUIVOALTBENEF (IDLOTEIMPORTA,NOMEARQUIVO,DATAIMPORTA,QTDEITENS,QTDEIMPORTA,HASHARQUIVO)');
      qryMaster.SQL.Add(' values('+inttostr(iIDLOTEIMPORTA)+','+QuotedStr(edtArquivo.text)+', trunc(sysdate),'+
                                   IntToStr(iNumeroTotal)+','+IntToStr(iNumeroOK)+','+QuotedStr(vHash)+')');
      qryMaster.ExecSQL;

      // Alimenta os detalhes com dados do vetor vListaDados que veio da planilha status ok e grava tambem na Benef.
      for i := low(vDadosProntos) to high(vDadosProntos) do
      begin
        qryDet.Close;
        qryDet.sql.clear;
        qryDet.SQL.Add('Insert into CM.HSTARQUIVOALTBENEFDET (');
        qryDet.SQL.Add('IDHSTARQUIVOALTBENEFDET');
        qryDet.SQL.Add(',MATRICULA');
        qryDet.SQL.Add(',IDLOTEIMPORTA');
        qryDet.SQL.Add(',NUMEROPROCESSO');
        qryDet.SQL.Add(',VALORATUAL');
        qryDet.SQL.Add(',VALORTOTAL');
        qryDet.SQL.Add(',VALORSRB');
        qryDet.SQL.Add(',VLRBSTOTAL');
        qryDet.SQL.Add(',VLRFABTOTAL');
        qryDet.SQL.Add(',VLRBSATUAL');
        qryDet.SQL.Add(',VLRFABATUAL');
        qryDet.SQL.Add(',IDPESSOA');
        qryDet.SQL.Add(',IDTITULAR');
        qryDet.SQL.Add(',IDPLANOPREV');
        qryDet.SQL.Add(',IDPESSJUR');
        qryDet.SQL.Add(',SEQPROPOSTA');
        qryDet.SQL.Add(',VALORATUALANT');
        qryDet.SQL.Add(',VALORTOTALANT');
        qryDet.SQL.Add(',VALORSRBANT');
        qryDet.SQL.Add(',VLRBSTOTALANT');
        qryDet.SQL.Add(',VLRFABTOTALANT');
        qryDet.SQL.Add(',VLRBSATUALANT');
        qryDet.SQL.Add(',VLRFABATUALANT)');
        qryDet.SQL.Add('VALUES(' +IntToStr(LeUltRegistro(nil, 'HSTARQUIVOALTBENEFDET'))+',');
        qryDet.SQL.Add('   '+ QuotedStr(vDadosProntos[i].sMatricula)+',');
        qryDet.SQL.Add('   '+ inttostr(iIDLOTEIMPORTA) +',');
        qryDet.SQL.Add('   '+ inttostr(vDadosProntos[i].iProcesso) +',');
        qryDet.SQL.Add('   '+ oranumero(FloatToStr(vDadosProntos[i].dVlrAtual)) +',');
        qryDet.SQL.Add('   '+ oranumero(FloatToStr(vDadosProntos[i].dVlrTotal)) +',');
        qryDet.SQL.Add('   '+ oranumero(FloatToStr(vDadosProntos[i].dVlrSRB)) +',');
        qryDet.SQL.Add('   '+ oranumero(FloatToStr(vDadosProntos[i].dVlrTotalBS)) +',');
        qryDet.SQL.Add('   '+ oranumero(FloatToStr(vDadosProntos[i].dVlrTotalFAB)) +',');
        qryDet.SQL.Add('   '+ oranumero(FloatToStr(vDadosProntos[i].dVlrAtualBS)) +',');
        qryDet.SQL.Add('   '+ oranumero(FloatToStr(vDadosProntos[i].dVlrAtualFAB)) +',');
        qryDet.SQL.Add('   '+ inttostr(vDadosProntos[i].iIdPessoa) +',');
        qryDet.SQL.Add('   '+ inttostr(vDadosProntos[i].iIdTitular) +',');
        qryDet.SQL.Add('   '+ inttostr(vDadosProntos[i].iIdPlanoPrev) +',');
        qryDet.SQL.Add('   '+ inttostr(vDadosProntos[i].iIdPessJur) +',');
        qryDet.SQL.Add('   '+ inttostr(vDadosProntos[i].iSeqProposta) +',');
        qryDet.SQL.Add('   '+ oranumero(FloatToStr(vDadosProntos[i].dVlrAtualANT)) +',');
        qryDet.SQL.Add('   '+ oranumero(FloatToStr(vDadosProntos[i].dVlrTotalANT)) +',');
        qryDet.SQL.Add('   '+ oranumero(FloatToStr(vDadosProntos[i].dVlrSRBANT)) +',');
        qryDet.SQL.Add('   '+ oranumero(FloatToStr(vDadosProntos[i].dVlrTotalBSANT)) +',');
        qryDet.SQL.Add('   '+ oranumero(FloatToStr(vDadosProntos[i].dVlrTotalFABANT)) +',');
        qryDet.SQL.Add('   '+ oranumero(FloatToStr(vDadosProntos[i].dVlrAtualBSANT)) +',');
        qryDet.SQL.Add('   '+ oranumero(FloatToStr(vDadosProntos[i].dVlrAtualFABANT)) +')');
        qryDet.ExecSQL;

        qryAux.Close;
        qryAux.sql.clear;
        qryAux.SQL.Add('UPDATE CM.BENEFBFCIARIO SET ');
        qryAux.SQL.Add('VALORSRB    = '+ oranumero(FloatToStr(vDadosProntos[i].dVlrSRB)) +',' );
        qryAux.SQL.Add('VLRBSATUAL  = '+ oranumero(FloatToStr(vDadosProntos[i].dVlrAtualBS)) +',' );
        qryAux.SQL.Add('VLRFABATUAL = '+ oranumero(FloatToStr(vDadosProntos[i].dVlrAtualFAB)) +',' );
        qryAux.SQL.Add('VALORATUAL  = '+ oranumero(FloatToStr(vDadosProntos[i].dVlrAtual)) +',' );
        qryAux.SQL.Add('VLRBSTOTAL  = '+ oranumero(FloatToStr(vDadosProntos[i].dVlrTotalBS)) +',' );
        qryAux.SQL.Add('VLRFABTOTAL = '+ oranumero(FloatToStr(vDadosProntos[i].dVlrTotalFAB)) +',' );
        qryAux.SQL.Add('VALORTOTAL  = '+ oranumero(FloatToStr(vDadosProntos[i].dVlrTotal)) );
        qryAux.SQL.Add(' WHERE NUMEROPROCESSO  = '+ inttostr(vDadosProntos[i].iProcesso));
        qryAux.SQL.Add(' AND IDPESSOA          = '+ inttostr(vDadosProntos[i].iIdPessoa));
        qryAux.SQL.Add(' AND IDTITULAR         = '+ inttostr(vDadosProntos[i].iIdTitular));
        qryAux.SQL.Add(' AND IDPLANOPREV       = '+ inttostr(vDadosProntos[i].iIdPlanoPrev));
        qryAux.SQL.Add(' AND IDPESSJUR         = '+ inttostr(vDadosProntos[i].iIdPessJur));
        qryAux.SQL.Add(' AND SEQPROPOSTA       = '+ inttostr(vDadosProntos[i].iSeqProposta));

        qryAux.ExecSQL;

        qryBenefBfciario.Close;
        qryBenefBfciario.sql.clear;
        qryBenefBfciario.SQL.Add('SELECT * FROM CM.BENEFBFCIARIO ');
        qryBenefBfciario.SQL.Add(' WHERE NUMEROPROCESSO ='+ inttostr(vDadosProntos[i].iProcesso));
        qryBenefBfciario.Open;
       
        // MovBenef
        idCalculo := -1;
        CriaLogOcorrencia(qryBenefBfciario.fieldbyname('idplanoprev').asstring,
                          qryBenefBfciario.fieldbyname('idpessjur').asstring,
                          qryBenefBfciario.fieldbyname('idtitular').asstring,
                          qryBenefBfciario.fieldbyname('idbeneficio').asstring,
                          qryBenefBfciario.fieldbyname('numeroprocesso').asstring,
                          qryBenefBfciario.fieldbyname('idpessoa').asstring,
                          qryBenefBfciario.fieldbyname('seqproposta').asstring,
                          '18',
                          DateToStr(date),
                          floattostr(qryBenefBfciario.fieldbyname('valoratual').asfloat),
                          floattostr(qryBenefBfciario.fieldbyname('valortotal').asfloat),
                          floattostr(qryBenefBfciario.fieldbyname('valorcotas').asfloat),
                          qryBenefBfciario.fieldbyname('datainicio').asstring,
                          qryBenefBfciario.fieldbyname('datafinal').asstring,
                          floattostr(qryBenefBfciario.fieldbyname('valoratual').asfloat),
                          qryBenefBfciario.fieldbyname('datainicio').asstring,
                          qryBenefBfciario.fieldbyname('datafinal').asstring,
                          qryBenefBfciario.fieldbyname('IDSITBENEFICIO').asstring, 0,
                          qryAux, '',
                          -1,
                          idCalculo );
      end;

      dtmBaseDados.dbBaseDados.Commit;
      MsgDlg('Arquivo importado com sucesso.', 'Informação', mtInformation, [mbOk], 0);
      setlength(vDadosProntos, 0);
      btnValida.enabled := false;
      qryImportado.Close;
      qryImportado.Open;
      pcGrid.ActivePage := tbImportados;
      bbtnConfirmar.enabled := false;

    except
       on e:Exception do
        begin
          TratarErro(e.Message);
          dtmBaseDados.dbBaseDados.RollBack;
          MsgDlg('Erro ao atualizar dados de benefício. ','Erro',mtError,[mbOk,mbHelp],0);
          Exit;
        end;
    end;

  finally
     // fechar as querys
     qryMaster.Close;
     qryDet.Close;
  end;



end;


procedure TfrmAlteraBeneficioLote.btnInverteClick(Sender: TObject);
begin
  inherited;
   if not qryImportado.isempty then
   begin
     qryImportado.First;
     qryImportado.DisableControls;
     while not qryImportado.eof do
       begin
         qryImportado.edit;
         qryImportado.FieldByName('SELECIONAR').AsString:='N';
         qryImportado.post;
         qryImportado.Next;
       end;
     qryImportado.First;
     qryImportado.EnableControls;
     bbtnCancelar.enabled := False;
   end;

end;

procedure TfrmAlteraBeneficioLote.dbGridValorBenefImportDblClick(
  Sender: TObject);
begin
  inherited;
 if qryImportado.FieldByName('SELECIONAR').AsString='S' then
    begin
     qryImportado.edit;
     qryImportado.FieldByName('SELECIONAR').AsString:='N';
     qryImportado.post;
     qtCk:=qtCk-1;
    end
 else
    begin
     qryImportado.edit;
     qryImportado.FieldByName('SELECIONAR').AsString:='S';
     qryImportado.post;
    qtCk:=qtCk+1;
    end;

 bbtnCancelar.enabled := qtCk>0 ;

end;

procedure TfrmAlteraBeneficioLote.btnSelTudoClick(Sender: TObject);
begin
  inherited;
  if not qryImportado.isempty then
   begin
     qryImportado.First;
     qryImportado.DisableControls;
     while not qryImportado.eof do
      begin
        qryImportado.edit;
        qryImportado.FieldByName('SELECIONAR').AsString:='S';
        qryImportado.post;
        qryImportado.Next;
      end;
     qryImportado.First;
     qryImportado.EnableControls;
     bbtnCancelar.enabled := True;
  end;

end;

procedure TfrmAlteraBeneficioLote.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  qryImportado.Filter:='Selecionar ='+#39+'S'+#39;
  qryImportado.Filtered:=True;
  qryImportado.Active:=True;

  try
    if MsgDlg('Deseja efetuar o Desfazer ? ','Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrNo then
       exit;

    If not dtmBaseDados.dbBaseDados.InTransaction Then
       dtmBaseDados.dbBaseDados.StartTransaction;
    try

     //  Executar o desfazer
       qryImportado.First;
       while not qryImportado.Eof do
         begin
          qryImportadoDet.Close;
          qryImportadoDet.sql.clear;
          qryImportadoDet.sql.Add('SELECT H.* ');
          qryImportadoDet.sql.Add(' FROM CM.HSTARQUIVOALTBENEFDET  H ');
          qryImportadoDet.sql.Add(' WHERE H.IDLOTEIMPORTA = '+ qryImportado.fieldbyname('IDLOTEIMPORTA').AsString);
          qryImportadoDet.Open ;
          qryImportadoDet.First;
          while not qryImportadoDet.Eof do
            begin
              qryAux.Close;
              qryAux.sql.clear;
              qryAux.SQL.Add('UPDATE CM.BENEFBFCIARIO SET ');
              qryAux.SQL.Add('VALORSRB               = '+ oranumero(qryImportadoDet.fieldbyname('VALORSRBANT').AsString)+',');
              qryAux.SQL.Add('VLRBSATUAL             = '+ oranumero(qryImportadoDet.fieldbyname('VLRBSATUALANT').AsString)+',');
              qryAux.SQL.Add('VLRFABATUAL            = '+ oranumero(qryImportadoDet.fieldbyname('VLRFABATUALANT').AsString)+',');
              qryAux.SQL.Add('VALORATUAL             = '+ oranumero(qryImportadoDet.fieldbyname('VALORATUALANT').AsString)+',');
              qryAux.SQL.Add('VLRBSTOTAL             = '+ oranumero(qryImportadoDet.fieldbyname('VLRBSTOTALANT').AsString)+',');
              qryAux.SQL.Add('VLRFABTOTAL            = '+ oranumero(qryImportadoDet.fieldbyname('VLRFABTOTALANT').AsString)+',');
              qryAux.SQL.Add('VALORTOTAL             = '+ oranumero(qryImportadoDet.fieldbyname('VALORTOTALANT').AsString));
              qryAux.SQL.Add(' WHERE NUMEROPROCESSO  = '+ qryImportadoDet.fieldbyname('NUMEROPROCESSO').AsString);
              qryAux.SQL.Add(' AND IDPESSOA          = '+ qryImportadoDet.fieldbyname('IDPESSOA').AsString);
              qryAux.SQL.Add(' AND IDTITULAR         = '+ qryImportadoDet.fieldbyname('IDTITULAR').AsString);
              qryAux.SQL.Add(' AND IDPLANOPREV       = '+ qryImportadoDet.fieldbyname('IDPLANOPREV').AsString);
              qryAux.SQL.Add(' AND IDPESSJUR         = '+ qryImportadoDet.fieldbyname('IDPESSJUR').AsString);
              qryAux.SQL.Add(' AND SEQPROPOSTA       = '+ qryImportadoDet.fieldbyname('SEQPROPOSTA').AsString);

              qryAux.ExecSQL;

              qryBenefBfciario.Close;
              qryBenefBfciario.sql.clear;
              qryBenefBfciario.SQL.Add('SELECT * FROM CM.BENEFBFCIARIO ');
              qryBenefBfciario.SQL.Add(' WHERE NUMEROPROCESSO  ='+ qryImportadoDet.fieldbyname('NUMEROPROCESSO').AsString);
              qryBenefBfciario.Open;

              // MovBenef
              idCalculo := -1;
              CriaLogOcorrencia(qryBenefBfciario.fieldbyname('idplanoprev').asstring,
                                qryBenefBfciario.fieldbyname('idpessjur').asstring,
                                qryBenefBfciario.fieldbyname('idtitular').asstring,
                                qryBenefBfciario.fieldbyname('idbeneficio').asstring,
                                qryBenefBfciario.fieldbyname('numeroprocesso').asstring,
                                qryBenefBfciario.fieldbyname('idpessoa').asstring,
                                qryBenefBfciario.fieldbyname('seqproposta').asstring,
                                '18',
                                DateToStr(date),
                                floattostr(qryBenefBfciario.fieldbyname('valoratual').asfloat),
                                floattostr(qryBenefBfciario.fieldbyname('valortotal').asfloat),
                                floattostr(qryBenefBfciario.fieldbyname('valorcotas').asfloat),
                                qryBenefBfciario.fieldbyname('datainicio').asstring,
                                qryBenefBfciario.fieldbyname('datafinal').asstring,
                                floattostr(qryBenefBfciario.fieldbyname('valoratual').asfloat),
                                qryBenefBfciario.fieldbyname('datainicio').asstring,
                                qryBenefBfciario.fieldbyname('datafinal').asstring,
                                qryBenefBfciario.fieldbyname('IDSITBENEFICIO').asstring, 0,
                                qryAux, '',
                                -1,
                                idCalculo );     
              qryImportadoDet.Next;
            end;
          qryImportadoDet.Close;
          qryImportadoDet.sql.clear;
          qryImportadoDet.SQL.Add('DELETE CM.HSTARQUIVOALTBENEFDET WHERE IDLOTEIMPORTA = '+ qryImportado.fieldbyname('IDLOTEIMPORTA').AsString);
          qryImportadoDet.ExecSQL;
          qryImportadoDet.Close;
          qryImportadoDet.sql.clear;
          qryImportadoDet.SQL.Add('DELETE CM.HSTARQUIVOALTBENEF WHERE IDLOTEIMPORTA = '+ qryImportado.fieldbyname('IDLOTEIMPORTA').AsString);
          qryImportadoDet.ExecSQL;
          qryImportado.Next;
         end;

       dtmBaseDados.dbBaseDados.Commit;
       MsgDlg('Arquivo Desfeito com sucesso.', 'Informação', mtInformation, [mbOk], 0);
       //carrega de novo grig
    except
       If dtmBaseDados.dbBaseDados.InTransaction   Then
          dtmBaseDados.dbBaseDados.Rollback;
    end;

  finally
    bbtnCancelar.Enabled:=False;

    qryImportado.Filtered:=False;
    qryImportado.Filtered := FALSE;
    qryImportado.Close;
    qryImportado.Open;
    pcGrid.ActivePage := tbImportados;
    qryDet.Close;
    qryAux.Close;
    qryBenefBfciario.Close;
    qryImportadoDet.Close;

  end;

end;

procedure TfrmAlteraBeneficioLote.dbGridValorBenefImportDrawDataCell(
  Sender: TObject; const Rect: TRect; Field: TField;
  State: TGridDrawState);
begin
  inherited;
  dbGridValorBenefImport.DefaultDrawDataCell(Rect, Field, State);

end;

end.
