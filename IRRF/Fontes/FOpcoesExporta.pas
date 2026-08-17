unit FOpcoesExporta;

//***************************************************************************************
//Nº SIG ...........: 83655
//Data da Alteração.: 20/03/2019
//Responsável ......: Taffarel Sevaybriker
//Descrição ........: Alteração no relatório de Resgates para não agrupar por CPF.
//**************************************************************************************
//Nº SOL ...........: SOL242573 / 16949
//Nº KTN/PPM .......: 979572
//Data da Alteração.: 04/09/2015
//Alteração Form ...: Alteração da Funcionalidade de acordo com o SOL
//Responsável ......: Robson J. P. Andrade
//Descrição ........: Gerar Relatório de Recebimento de Contribuições e Resgates
//**************************************************************************************
//Nº SOL: 242573/16949
//Nº KTN/PPM: 667436
//Data da Alteração: 24/02/2015
//Alteração Form: Criação da funcionalidade
//Responsável: Edilaine Ferraresi
//Descrição: Gerar Relatório de Recebimento de Contribuições e Resgates
//**************************************************************************************



interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, USistema, CommDlg, ComObj,
  QExport3, QExport3XLS, DBClient, uCMClientDataSet, Provider, FAguarde,
  UFuncoesUteis, uMensErro, BfDialogs, BrowseFolder, uProcuraDir;

type
   { Robson.Andrade - SOL242573 / 16949 PPM 979572 }
   TDadosRel      = (drDataPagto, drNomePart, drCPFPart, drCNPJCia, drVrContr);
   TTipoRelatorio = (trContrib,trResgate);


   TRecValores = record
     vlrBruto : currency;
     vlrIRRF  : currency;
     vlrLiq   : currency;
  end;

  TFrmOpcoesExporta = class(TfrmOkCancelar)
    rdgTpExport: TRadioGroup;
    qryEmpresa: TwwQuery;
    GroupBox1: TGroupBox;
    edtArquivo: TEdit;
    bbtnSel: TBitBtn;
    AbrirDlg: TProcuraDirDlg;
    procedure bbtnSelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { PFrmOpcoesExportaions }
    FdDataFim: TDateTime;
    FdDataIni: TDateTime;
    FtTipoRel: TTipoRelatorio;
   //Procedure GerarExcelT;   Robson.Andrade - SOL242573 / 16949 PPM 979572
   //Procedure GerarArquivo;    Robson.Andrade - SOL242573 / 16949 PPM 979572

  public
    { Public declarations }

    property dDataIni : TDateTime read FdDataIni write FdDataIni;
    property dDataFim : TDateTime read FdDataFim write FdDataFim;
    property tTipoRel : TTipoRelatorio read FtTipoRel write FtTipoRel;
  end;

var
  FrmOpcoesExporta: TFrmOpcoesExporta;

implementation

uses FRelRecContrib;

{$R *.DFM}

{ TFrmOpcoesExporta }

{Objetivo : Mostrar ao usuário o percentual concluído da tarefa em andamento
Robson.Andrade - SOL242573 / 16949 PPM 979572 }
Function GetPercentualDoProcesso(iTotal, iAtual : Integer ): string;
var
   iValor : Double;
begin
   iValor := (100 * iAtual) / iTotal ;
   Result := FormatFloat('#,#0.00', iValor)+'%';
end;

{ Objetivo : Ler Strings entre ponto e virgula ";"
  Robson.Andrade - SOL242573 / 16949 PPM 979572 }
Function LerEntrePontos(sLinhaComPontos: string; iPonto1, iPonto2 : Integer): string;
var
   iTotalPontos: Integer;
   iCount      : Integer;
   iPosicao    : Integer;
   iQuant      : Integer;
   bPonto1     : Boolean;
   bPonto2     : Boolean;
   sResult     : string;

begin
  iTotalPontos := 0;
  iPosicao     := 0;
  iQuant       := 0;
  bPonto1      := False;
  bPonto2      := False;
  sResult      := '';
  { 20082015;HANS HERBERT LAUBMEYER FILHO;00000114790;RJ;00436923000190;1107,72 - Modelo sLinhaComPontos }
  For iCount := 1 to Length(sLinhaComPontos) do
    begin
      if sLinhaComPontos[iCount] = ';' then
        Inc(iTotalPontos);
      { se iPonto 1 = 0 então é porquê a leitura deve ser feita a partir da 1ª posição da linha
       Robson.Andrade - SOL242573 / 16949 PPM 979572 }
      if iPonto1 = 0 then
        iPosicao := 1;

      { Localiza a posição inicial
       Robson.Andrade - SOL242573 / 16949 PPM 979572 }
      if (iTotalPontos = iPonto1) and (not bPonto1) then
        begin
          bPonto1   := True;
          iPosicao  := iCount + 1;
        end;

      {Começa a contar a quantidade de caracteres a ser copiado
       Robson.Andrade - SOL242573 / 16949 PPM 979572 }
      if bPonto1 then Inc(iQuant);

      { Define o total de caracteres que será copiado
       Robson.Andrade - SOL242573 / 16949 PPM 979572 }
      if (iTotalPontos = iPonto2) or (iCount = Length(sLinhaComPontos)) then
        begin
          bPonto2   := True;
          if iPosicao = 1 then
           Dec(iQuant)
          else
          begin
            if iCount = Length(sLinhaComPontos) then
             Dec(iQuant)
            else
             Dec(iQuant,2);
          end;
        end;

      if bPonto1 and bPonto2 then
       begin
          sResult := Copy(sLinhaComPontos,iPosicao,iQuant);
          Break;
       end;
    end;
   Result := sResult;
end;


function IntervaloMeses(DataIni, DataFin: string): Integer;
var
  wAux, wDiaIni, wMesIni, wAnoIni, wDiaFin, wMesFin, wAnoFin: word;
begin
  wAux := 0;
  try
    DecodeDate(StrToDate(DataIni), wAnoIni, wMesIni, wDiaIni);
    DecodeDate(StrToDate(DataFin), wAnoFin, wMesFin, wDiaFin);

    if (StrToDate(DataIni) <= StrToDate(DataFin)) then
      wAux := (wAnoFin*12+wMesFin) - (wAnoIni*12+wMesIni);

    if (wDiaIni > wDiaFin) then
      Dec(wAux);
  finally
    Result := wAux;
  end;
end;

function TrocaCaracter(aStr, aOld, aNew : String) : string;
begin
  Result := StringReplace(aStr, aOld, aNew, [rfReplaceAll]);
end;

function iif(condicao : boolean; strTrue, strFalse : string) : string;
begin
  if (condicao) then
    result := strTrue
  else result := strFalse;
end;


function IncMes(DataIni: TDateTime; iNumMes : integer): TDateTime;
var
  iDiaIni, iMesIni, iAnoIni, iMesFim, iAnoFim: word;
begin
  DecodeDate(DataIni, iAnoIni, iMesIni, iDiaIni);

  { Robson.Andrade - SOL242573 / 16949 PPM 979572 - Inicio}
  {iDiaIni := ExtraiDia(DataIni);
  iMesIni := ExtraiMes(DataIni);
  iAnoIni := ExtraiAno(DataIni);}
  { Robson.Andrade - SOL242573 / 16949 PPM 979572 - Fim }


  { calcula quantos Anos inteiros há no período em meses e já calcula o ano resultante
    Robson.Andrade - SOL242573 / 16949 PPM 979572 }
  iAnoFim := iAnoIni + (iMesIni div 12);

   { Calculo o mes atual
   Robson.Andrade - SOL242573 / 16949 PPM 979572 }
  if ((iMesIni+iNumMes {1}) > 12) then
    iMesFim := 1
  else
    iMesFim := iMesIni+iNumMes{1};

  { Verifico o ultimo dia do mes
    Robson.Andrade - SOL242573 / 16949 PPM 979572 }
  if (iDiaIni > TrazUltDiaMes(iMesFim,iAnoFim)) then
    iDiaIni := TrazUltDiaMes(iMesFim, iAnoFim);

  Result := EncodeDate(iAnoFim, iMesFim, iDiaIni);
end;



{ Robson.Andrade - SOL242573 / 16949 PPM 979572 }
procedure TFrmOpcoesExporta.bbtnSelClick(Sender: TObject);
begin
  inherited;
  if AbrirDlg.Execute then
    edtArquivo.Text := AbrirDlg.Directory
  else
    edtArquivo.Clear;

  bbtnConfirmar.Enabled := Length(Trim(edtArquivo.Text)) > 0;

end;


procedure TFrmOpcoesExporta.FormCreate(Sender: TObject);
begin
  inherited;
  bbtnConfirmar.Enabled := False
end;

{ Robson.Andrade - SOL242573 / 16949 PPM 979572  - Inicio
procedure TFrmOpcoesExporta.GerarExcelT;
var
   intColuna : Integer;
   intLinha  : Integer;
   vExcel    : variant;
   valor: string;
begin
  try
    vExcel := CreateOleObject('Excel.Application');
    vExcel.Workbooks.add(1);
  except
    Application.MessageBox ('Versão do Ms-Excel incompatível','Erro',MB_OK+MB_ICONEXCLAMATION);
  end;

  FrmRelRecContrib.CDSTipoArquivo.First;

  Try
    For intLinha := 0 to FrmRelRecContrib.CDSTipoArquivo.RecordCount -1 do
    begin
      For intColuna:=1 to FrmRelRecContrib.CDSTipoArquivo.FieldCount do
       begin
         valor:= FrmRelRecContrib.CDSTipoArquivo.Fields[intColuna-1].AsString;
         vExcel.cells [intLinha+2,intColuna] :=  valor;
       end;
       FrmRelRecContrib.CDSTipoArquivo.Next;
    end;

    For intColuna:=1 to FrmRelRecContrib.CDSTipoArquivo.FieldCount do
    begin
     valor:= FrmRelRecContrib.CDSTipoArquivo.Fields[intColuna-1].DisplayLabel;
     vExcel.cells[1,intColuna] := valor;
    end;
    vExcel.columns.AutoFit;
    vExcel.visible:=true;
    vExcel.SaveAs(edtArquivo.Text + '\AAA.xlsx');
  except
    Application.MessageBox ('Aconteceu um erro desconhecido durante a conversão da tabela para o Ms-Excel','Erro',MB_OK+MB_ICONEXCLAMATION);
  end;
end;



procedure TFrmOpcoesExporta.GerarArquivo;
var
  intLinha  : Integer;
  intColuna : Integer;
  vPasta    : Variant;
begin
  If (FrmRelRecContrib.CDSTipoArquivo.RecordCount > 0) then
    begin
      intLinha   := 1;
      vPasta := CreateOleObject('Excel.Application'); // cria uma aplicação do Excel
      vPasta.WorkBooks.Add(1); // adiciona uma pasta do Excel
      vPasta.Caption := 'Plan01'; // Título da planilha
      vPasta.Workbooks[1].sheets[1].Name:=FrmRelRecContrib.CDSTipoArquivo.Name;
      vPasta.Visible := False; // Deixa a planilha invisível
      For intColuna:= 0 to (FrmRelRecContrib.CDSTipoArquivo.FieldCount -1) do
        begin
          vPasta.Cells[intLinha,intColuna + 1] := FrmRelRecContrib.CDSTipoArquivo.Fields[intColuna].DisplayLabel;           // Aqui será verificado o formato do campo e aplicado a respectiva formatação
          Case FrmRelRecContrib.CDSTipoArquivo.Fields[intColuna].DataType of
            ftDate    : vPasta.Columns.Columns[intColuna+1].NumberFormat := 'dd/mm/aaaa';
            ftTime    : vPasta.Columns.Columns[intColuna+1].NumberFormat := 'hh:mm:ss';
            ftDateTime: vPasta.Columns.Columns[intColuna+1].NumberFormat := 'dd/mm/aaaa';
            ftCurrency: vPasta.Columns.Columns[intColuna+1].NumberFormat := '#.##0,00';
            ftFloat   : vPasta.Columns.Columns[intColuna+1].NumberFormat := '#.##0';
            ftBCD     : vPasta.Columns.Columns[intColuna+1].NumberFormat := '#.##0,00';
            ftString  : vPasta.Columns.Columns[intColuna+1].NumberFormat := '';
            //ftExtended: vPasta.Columns.Columns[intColuna+1].NumberFormat := '#.##0,00';
          end;
        end;
      intLinha := intLinha + 1;
      FrmRelRecContrib.CDSTipoArquivo.First;
      //FrmRelRecContrib.CDSTipoArquivo.DisableControls;
      Try
        While not FrmRelRecContrib.CDSTipoArquivo.Eof do //executa enquanto não for fim da tabela
          begin
            Try
              For intColuna := 0 to (FrmRelRecContrib.CDSTipoArquivo.FieldCount -1 ) do
                vPasta.Cells[intLinha,intColuna + 1] := FrmRelRecContrib.CDSTipoArquivo.Fields[intColuna].AsString;     //:= FrmRelRecContrib.CDSTipoArquivo.Fields[intColuna].value;
              intLinha := intLinha + 1;
              FrmRelRecContrib.CDSTipoArquivo.Next;
              //GgExp.Progress:=GgExp.Progress+1;
            Except
            End;
            Application.ProcessMessages;
          end;
          vPasta.Columns.AutoFit; // Faz auto ajuste das colunas do Excel
          vPasta.WorkBooks[1].Sheets[1].Protect(DrawingObjects:=True, Contents:=True,   Scenarios:=True,         Password:='1234'); // Coloca Senha de Proteção na Planilha 01
        //If  SaveExcel.Execute then // O componente SaveDialogs está na paleta Dialogs
          vPasta.WorkBooks[1].SaveAs(edtArquivo.Text + '\AAAA.xlsx'); // Salva a Planilha (Salvar como)
        //vPasta.Visible := True; //Deixa a planilha visível
      Finally
        FrmRelRecContrib.CDSTipoArquivo.EnableControls;  // sempre será executada essa linha
        //vPasta.quit;
        vPasta:=null;
        vPasta := Unassigned;
      end;
    end
  else
    Application.MessageBox ('Aconteceu um erro desconhecido durante a conversão da tabela para o Ms-Excel','Erro',MB_OK+MB_ICONEXCLAMATION);
end;
{ Robson.Andrade - SOL242573 / 16949 PPM 979572  - Fim
}


procedure TFrmOpcoesExporta.bbtnConfirmarClick(Sender: TObject);
var
  sAnomES    : string;
  sNomeArq   : string;
  lstDados   : TStringList;
  lstLinha   : TStringList;
  lstExcel   : TStringList;
  strMensagem: string;
  qryDados   : TwwQuery;
  sCPF       : string;
  sLinha     : string;
  dDtSolic   : TDateTime;
  dDtPagto   : TDateTime;
  rValor     : TRecValores;
  ind, col   : byte;
  iMeses     : byte;
  iTotMes    : byte;
  lin        : integer;
  bFinalizou : boolean;
  dPerIni    : TDateTime;
  dPerFim    : TDateTime;
  sExtensao  : string;
  ExcelApp   : Variant;
  sheet      : Variant;
  intCount   : Integer;
  intCol     : Integer;
  intLin     : Integer;
  iTotal     : Integer;
  iConta     : Integer;
  sArquivo   : string;
begin
  inherited;
  try
    lstDados := TStringList.create;
    lstLinha := TStringList.create;
    qryDados := TwwQuery.Create(Application);
    qryDados.DatabaseName := 'BaseDados';
    try
      Self.Cursor           := crSQLWait;
      bbtnConfirmar.Enabled := False;
      bbtnCancelar.Enabled  := False;
      bbtnSair.Enabled      := False;
      bbtnAjuda.Enabled     := False;
      bbtnSel.Enabled       := False;


       { Extensão do arquivo - Robson.Andrade - SOL242573 / 16949 PPM 979572 }
       sExtensao := iif(rdgTpExport.ItemIndex = 0,'.xlsx','.csv');

       { Tipo de arquivo }
       sArquivo := iif( tTipoRel = trContrib,'Contrib.','Resg.');

       { busca dados da empresa - Robson.Andrade - SOL242573 / 16949 PPM 979572 }
       qryEmpresa.close;
       qryEmpresa.Params[0].AsInteger := Sistema.idEmpresa;
       qryEmpresa.open;

       for iMeses := 1 to Length(FrmRelRecContrib.arrCDS) do
       begin
         { definindo periodo - Robson.Andrade - SOL242573 / 16949 PPM 979572 }
         dPerIni := StrToDate(FrmRelRecContrib.LerMes(FrmRelRecContrib.arMesAno,iMeses - 1));
         dPerFim := TrazUltDiaData( dPerIni );

         FrmRelRecContrib.arrCDS[iMeses -1].First;

         frmAguarde.Mostra('Gerando arquivo de '+ sArquivo +' ref '+Copy(RetornaNomeMes(StrToInt( FormatDateTime('mm',dPerIni))),1,3) +'/'+ FormatDateTime('yyyy',dPerIni) );

         if not FrmRelRecContrib.arrCDS[iMeses -1].Eof then
         begin

           { inicia valores - Robson.Andrade - SOL242573 / 16949 PPM 979572 }
           sAnoMes         := '';
           dDtSolic        := 0;
           dDtPagto        := 0;
           bFinalizou      := False;
           rValor.vlrBruto := 0;
           rValor.vlrIRRF  := 0;
           rValor.vlrLiq   := 0;
           lstLinha.clear;

           { cabeçalho e nome do arquivo - Robson.Andrade - SOL242573 / 16949 PPM 979572 }
           lstDados.Clear;
           case tTipoRel of
             trContrib : lstDados.Add('DT_PAGTO'+#59+'NOM_PARTIC'+#59+'CPF_PARTIC'+#59+'UF_PARTIC'+#59+'CNPJ_CIA'+#59+'VR_CONTR');
             trResgate : lstDados.Add('DT_SOLIC'+#59+'NOM_PARTIC'+#59+'CPF_PARTIC'+#59+'CNPJ_CIA'+#59+'DT_PAGTO'+#59+'VR_BRUTO'+#59+'IRRF'+#59+'VR_LIQ');
           end;
           sAnoMes  := FrmRelRecContrib.arrCDS[iMeses - 1].FieldByName('ANOMES').AsString;

           { nome inicial do arquivo de saida - Robson.Andrade - SOL242573 / 16949 PPM 979572 }
           Case FtTipoRel of
             trContrib : sNomeArq := 'CONTRIREC';
             trResgate : sNomeArq :=  'PAGTORESGATES';
           end;


           sNomeArq :=  sNomeArq +'_'+ copy(sAnoMes, 6,2)+copy(sAnoMes,1,4) + sExtensao;

           sCPF := FrmRelRecContrib.arrCDS[iMeses - 1].FieldByName('CPF').AsString;
           while not FrmRelRecContrib.arrCDS[iMeses - 1].Eof do
           begin
              if sCPF = FrmRelRecContrib.arrCDS[iMeses - 1].FieldByName('CPF').AsString then
              begin
                { guarda dados do CPF - Robson.Andrade - SOL242573 / 16949 PPM 979572 }
                case tTipoRel of
                  trResgate : begin
                                //Taffarel - SIG83655 - início
                                {if lstLinha.Count = 0 then
                                begin
                                  lstLinha.Add(FrmRelRecContrib.arrCDS[iMeses - 1].FieldByName('DATAREGISTRO').AsString);
                                  lstLinha.Add(FrmRelRecContrib.arrCDS[iMeses - 1].FieldByName('NOME').AsString);
                                  lstLinha.Add(FrmRelRecContrib.arrCDS[iMeses - 1].FieldByName('CPF').AsString);
                                  lstLinha.Add(qryEmpresa.FieldByName('NUMDOCUMENTO').AsString);
                                  lstLinha.Add(FrmRelRecContrib.arrCDS[iMeses - 1].FieldByName('DATAPAGAMENTO').AsString);
                                end;
                                rValor.vlrBruto := rValor.vlrBruto + FrmRelRecContrib.arrCDS[iMeses - 1].FieldByName('VLR_BRUTO').AsCurrency;
                                rValor.vlrIRRF  := rValor.vlrIRRF  + FrmRelRecContrib.arrCDS[iMeses - 1].FieldByName('VLR_IRRF').AsCurrency;
                                rValor.vlrLiq   := rValor.vlrLiq   + FrmRelRecContrib.arrCDS[iMeses - 1].FieldByName('VLR_LIQUIDO').AsCurrency;

                                if dDtSolic < FrmRelRecContrib.arrCDS[iMeses - 1].FieldByName('DATAREGISTRO').AsDateTime then
                                   dDtSolic := FrmRelRecContrib.arrCDS[iMeses - 1].FieldByName('DATAREGISTRO').AsDateTime;

                                if dDtPagto < FrmRelRecContrib.arrCDS[iMeses - 1].FieldByName('DATAPAGAMENTO').AsDateTime then
                                   dDtPagto := FrmRelRecContrib.arrCDS[iMeses - 1].FieldByName('DATAPAGAMENTO').AsDateTime;}

                                lstLinha.Add(FrmRelRecContrib.arrCDS[iMeses - 1].FieldByName('DATAREGISTRO').AsString);
                                lstLinha.Add(FrmRelRecContrib.arrCDS[iMeses - 1].FieldByName('NOME').AsString);
                                lstLinha.Add(FrmRelRecContrib.arrCDS[iMeses - 1].FieldByName('CPF').AsString);
                                lstLinha.Add(qryEmpresa.FieldByName('NUMDOCUMENTO').AsString);
                                lstLinha.Add(FrmRelRecContrib.arrCDS[iMeses - 1].FieldByName('DATAPAGAMENTO').AsString);
                                rValor.vlrBruto := rValor.vlrBruto + FrmRelRecContrib.arrCDS[iMeses - 1].FieldByName('VLR_BRUTO').AsCurrency;
                                rValor.vlrIRRF  := rValor.vlrIRRF  + FrmRelRecContrib.arrCDS[iMeses - 1].FieldByName('VLR_IRRF').AsCurrency;
                                rValor.vlrLiq   := rValor.vlrLiq   + FrmRelRecContrib.arrCDS[iMeses - 1].FieldByName('VLR_LIQUIDO').AsCurrency;
                                dDtSolic := FrmRelRecContrib.arrCDS[iMeses - 1].FieldByName('DATAREGISTRO').AsDateTime;
                                dDtPagto := FrmRelRecContrib.arrCDS[iMeses - 1].FieldByName('DATAPAGAMENTO').AsDateTime;
                                //Taffarel - SIG83655 - fim
                              end;

                  trContrib : begin
                                if lstLinha.count = 0 then
                                begin
                                  lstLinha.Add(FrmRelRecContrib.arrCDS[iMeses - 1].FieldByName('DATAPAGAMENTO').AsString);
                                  lstLinha.Add(FrmRelRecContrib.arrCDS[iMeses - 1].FieldByName('NOME').AsString);
                                  lstLinha.Add(FrmRelRecContrib.arrCDS[iMeses - 1].FieldByName('CPF').AsString);
                                  lstLinha.Add(FrmRelRecContrib.arrCDS[iMeses - 1].FieldByName('UF').AsString);
                                  lstLinha.Add(qryEmpresa.FieldByName('NUMDOCUMENTO').AsString);
                                end;

                                rValor.vlrBruto := rValor.vlrBruto + FrmRelRecContrib.arrCDS[iMeses - 1].FieldByName('VLR_CONTRIB').AsCurrency;

                                if dDtPagto < FrmRelRecContrib.arrCDS[iMeses - 1].FieldByName('DATAPAGAMENTO').AsDateTime then
                                   dDtPagto := FrmRelRecContrib.arrCDS[iMeses - 1].FieldByName('DATAPAGAMENTO').AsDateTime;
                              end;
                end;
              end;



              FrmRelRecContrib.arrCDS[iMeses - 1].next;
              { valida fim do arquivo - Robson.Andrade - SOL242573 / 16949 PPM 979572 }
              if (not bFinalizou) and (FrmRelRecContrib.arrCDS[iMeses - 1].eof) then
                 bFinalizou := true;

              //if (sCPF <> FrmRelRecContrib.arrCDS[iMeses - 1].FieldByName('CPF').AsString) or (bFinalizou) then //Taffarel - SIG SIG83655
              if (sCPF <> FrmRelRecContrib.arrCDS[iMeses - 1].FieldByName('CPF').AsString) or (bFinalizou) or (tTipoRel = trResgate)  then //Taffarel - SIG SIG83655
              begin
                sLinha := '';

                { ajusta valores do CPF anterior - Robson.Andrade - SOL242573 / 16949 PPM 979572 }
                case tTipoRel of
                  trResgate : begin
                                lstLinha.Add(FormatCurr('#,##0.00', rValor.vlrBruto) );
                                lstLinha.Add(FormatCurr('#,##0.00', rValor.vlrIRRF) );
                                lstLinha.Add(FormatCurr('#,##0.00', rValor.vlrLiq) );
                                lstLinha.Strings[0] := FormatDateTime('ddmmyyyy', dDtSolic);
                                lstLinha.Strings[4] := FormatDateTime('ddmmyyyy', dDtPagto);
                              end;
                  trContrib : begin
                                {NÃO deverá permitir salvar no arquivo texto registros contendo valores zerados - Robson.Andrade - SOL242573 / 16949 PPM 979572 }
                                if rValor.vlrBruto = 0 then
                                begin
                                  lstLinha.clear;
                                  rValor.vlrBruto := 0;
                                end
                                else
                                begin
                                  lstLinha.Add(FormatCurr('#,##0.00', rValor.vlrBruto) );
                                  lstLinha.Strings[0] := FormatDateTime('ddmmyyyy', dDtPagto);
                                end;
                              end;
                end;

                if lstLinha.count > 0 then
                begin
                  for ind := 0 to lstLinha.count-1 do
                     sLinha := sLinha + iif(sLinha = EmptyStr, '', '|') + lstLinha.Strings[ind];

                  { o sistema NÃO deverá permitir registros com caracteres especiais no conteúdo dos campos,
                    tais como: ";"  "."  "/"  "-", caso ocorra deverão ser desconsiderados - Robson.Andrade - SOL242573 / 16949 PPM 979572 }
                  slinha := TrocaCaracter( TrocaCaracter(sLinha, ';', ''), '.', '');
                  slinha := TrocaCaracter(sLinha, '/', '');  //, '-', '');
                  slinha := TrocaCaracter(sLinha, '|', ';');

                  { insere linha no arquivo - Robson.Andrade - SOL242573 / 16949 PPM 979572 }
                  lstDados.Add( sLinha );

                  { zerando tudo - Robson.Andrade - SOL242573 / 16949 PPM 979572 }
                  dDtSolic        := 0;
                  dDtPagto        := 0;
                  rValor.vlrBruto := 0;
                  rValor.vlrIRRF  := 0;
                  rValor.vlrLiq   := 0;
                  lstLinha.clear;
                end;

                if not bFinalizou then
                   sCPF := FrmRelRecContrib.arrCDS[iMeses - 1].FieldByName('CPF').AsString;
              end;

              { grava arquivo - Robson.Andrade - SOL242573 / 16949 PPM 979572}
              if (bFinalizou) or (sAnoMes <> FrmRelRecContrib.arrCDS[iMeses - 1].FieldByName('ANOMES').AsString) then
               begin
                  { .csv -  Robson.Andrade - SOL242573 / 16949 PPM 979572  }
                  if sExtensao = '.csv' then
                   lstDados.SaveToFile( edtArquivo.Text + '\'+ sNomeArq )
                  else
                  { Robson.Andrade - SOL242573 / 16949 PPM 979572 }
                  begin
                   { .xlsx - Robson.Andrade - SOL242573 / 16949 PPM 979572}
                    ExcelApp        := CreateOleObject('Excel.Application');
                    ExcelApp.Visible:=false;
                    ExcelApp.WorkBooks.Add(-4167);
                    ExcelApp.WorkBooks[1].WorkSheets[1].Name:='Sheet1';
                    sheet           := ExcelApp.WorkBooks[1].WorkSheets['Sheet1'];

                    Application.ProcessMessages;

                    {% - Robson.Andrade - SOL242573 / 16949 PPM 979572}
                    iConta := 0;
                    iTotal := lstDados.Count -1;

                    For intCount := 0 to lstDados.Count -1 do
                      begin
                         if iTotal > 0 then
                           frmAguarde.lblMensagem.Caption := 'Exportando para Excel '+ sArquivo +' '+ Copy(RetornaNomeMes(StrToInt( FormatDateTime('mm',dPerIni))),1,3) +'/'+ FormatDateTime('yyyy',dPerIni) + chr(13) +
                                                             '( '+ GetPercentualDoProcesso(iTotal,intCount) + ' Processado )';
                         application.ProcessMessages;

                         { maior que zero, porquê na posição "0" da StringList está o Título das colunas - Robson.Andrade - SOL242573 / 16949 PPM 979572}
                         if intCount = 1 then
                           begin
                            { Formata os campos do .xlsx de acordo com o arquivo que está sendo gerado - Robson.Andrade - SOL242573 / 16949 PPM 979572}
                             Case FtTipoRel of
                               trContrib:
                               begin
                                 ExcelApp.Columns.Columns[3].NumberFormat := '00000000000';   {CPF  - Formatar 11 digitos para o CPF  - Robson.Andrade - SOL242573 / 16949 PPM 979572}
                                 ExcelApp.Columns.Columns[5].NumberFormat := '00000000000000';{CNPJ - Formatar 14 digitos para o CNPJ - Robson.Andrade - SOL242573 / 16949 PPM 979572}
                                 ExcelApp.Columns.Columns[6].NumberFormat := '#.##0,00';      { Formatar valor - Robson.Andrade - SOL242573 / 16949 PPM 979572}

                               end;
                               trResgate:
                               begin
                                 ExcelApp.Columns.Columns[3].NumberFormat := '00000000000';   {CPF  - Formatar 11 digitos para o CPF  - Robson.Andrade - SOL242573 / 16949 PPM 979572}
                                 ExcelApp.Columns.Columns[4].NumberFormat := '00000000000000';{CNPJ - Formatar 14 digitos para o CNPJ - Robson.Andrade - SOL242573 / 16949 PPM 979572}
                                 ExcelApp.Columns.Columns[6].NumberFormat := '#.##0,00';      { Formatar VR_BRUTO - Robson.Andrade - SOL242573 / 16949 PPM 979572}
                                 ExcelApp.Columns.Columns[7].NumberFormat := '#.##0,00';      { Formatar IRRF - Robson.Andrade - SOL242573 / 16949 PPM 979572}
                                 ExcelApp.Columns.Columns[8].NumberFormat := '#.##0,00';      { Formatar VLR_LIQUIDO - Robson.Andrade - SOL242573 / 16949 PPM 979572}
                               end;
                             end;


                           end;


                         Sheet.Cells[intCount + 1, 1 ] := LerEntrePontos(lstDados[intCount],0,1);  { Se tTipoRel  = trContrib DT_PAGTO,   se tTipoRel = trResgate  DT_SOLIC   - Robson.Andrade - SOL242573 / 16949 PPM 979572}
                         Sheet.Cells[intCount + 1, 2 ] := LerEntrePontos(lstDados[intCount],1,2);  { Se tTipoRel  = trContrib NOM_PARTIC, se tTipoRel = trResgate  NOM_PARTIC - Robson.Andrade - SOL242573 / 16949 PPM 979572}
                         Sheet.Cells[intCount + 1, 3 ] := LerEntrePontos(lstDados[intCount],2,3);  { Se tTipoRel  = trContrib CPF_PARTIC, se tTipoRel = trResgate  CPF_PARTIC - Robson.Andrade - SOL242573 / 16949 PPM 979572}
                         Sheet.Cells[intCount + 1, 4 ] := LerEntrePontos(lstDados[intCount],3,4);  { Se tTipoRel  = trContrib UF_PARTIC,  se tTipoRel =  trResgate CNPJ_CIA   - Robson.Andrade - SOL242573 / 16949 PPM 979572}
                         Sheet.Cells[intCount + 1, 5 ] := LerEntrePontos(lstDados[intCount],4,5);  { Se tTipoRel  = trContrib CNPJ_CIA,   se tTipoRel = trResgate  DT_PAGTO   - Robson.Andrade - SOL242573 / 16949 PPM 979572}
                         Sheet.Cells[intCount + 1, 6 ] := LerEntrePontos(lstDados[intCount],5,6);  { Se tTipoRel  = trContrib VR_CONTR,   se tTipoRel = trResgate  VR_BRUTO   - Robson.Andrade - SOL242573 / 16949 PPM 979572}

                         if tTipoRel = trResgate then
                           begin
                             Sheet.Cells[intCount + 1, 7 ] := LerEntrePontos(lstDados[intCount],6,7);  { IRRF  - Robson.Andrade - SOL242573 / 16949 PPM 979572}
                             Sheet.Cells[intCount + 1, 8 ] := LerEntrePontos(lstDados[intCount],7,8);  { VLR_LIQUIDO - Robson.Andrade - SOL242573 / 16949 PPM 979572 }
                           end;

                      end;
                    { Faz o ajuste automático do tamanho das celulas - Robson.Andrade - SOL242573 / 16949 PPM 979572 }
                    ExcelApp.Columns.AutoFit;
                    { Fecha o Arquivo Independente do resultado da Operação - Robson.Andrade - SOL242573 / 16949 PPM 979572 }

                    frmAguarde.lblMensagem.Caption := 'Aguarde ....' + chr(13)+'Salvando arquivo ...';
                    ExcelApp.ActiveWorkbook.SaveAs(edtArquivo.Text + '\'+ sNomeArq);
                    ExcelApp.ActiveWorkbook.Close(False);
                    ExcelApp.Quit;
                    frmAguarde.lblMensagem.Caption :='';
                    Application.ProcessMessages;
                  end;
               end;
           end;

         end;


       end;
      frmAguarde.Apaga;

      strMensagem := iif(Length(FrmRelRecContrib.arrCDS) > 1, 'Arquivos gerados com sucesso!','Arquivo gerado com sucesso!');

      MsgDlg( strMensagem, 'Informação', mtInformation, [mbOk], 0); { Robson.Andrade - SOL242573 / 16949 PPM 979572 }
    except
       on e : Exception do
       begin
            MessageDlg(e.message, mtWarning, [mbOK], 0);
       end;
    end;

  finally
     { Inicio -  Robson.Andrade - SOL242573 / 16949 PPM 979572 }
     Self.Cursor           := crDefault;
     bbtnConfirmar.Enabled := True;
     bbtnCancelar.Enabled  := True;
     bbtnSair.Enabled      := True;
     bbtnAjuda.Enabled     := True;

     FreeAndNil(lstDados);
     FreeAndNil(lstLinha);
     FreeAndNil(qryDados);
    { Fim -  Robson.Andrade - SOL242573 / 16949 PPM 979572 }
  end;
end;


end.

