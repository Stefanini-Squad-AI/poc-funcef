{-------------------------------------------------------------------------------
--------------------------------------------------------------------------------
ALTERAÇÕES  /  IMPLEMENTAÇÕES
--------------------------------------------------------------------------------
Alteração       : bbtnConfirmarClick
N.WO............: 27740
Data............: 31/03/2026
Responsável.....: Leandro Pocebon
Descrição.......: Indicador para processar a inclusão
---------------------------------------------------------------------------------
Alteração       : bbtnConfirmarClick
N.WO............: 24276
Data............: 26/09/2025  03/10/2025   15/10/2025
Responsável.....: Paulo Nobre
Descrição.......: Ajustes:
                  .Inclusão de uma flag de controle "bFlgFazFinanceiro" que
                   indicará se executará as atualizações financeiras. Por
                   definição dos Gestores, estas não serão realizadas, então esta
                   flag sempre estará = "False".
                  .Não é preciso atualizar os valores da tabela HSTCONTRIBPREV.
---------------------------------------------------------------------------------
Alteração  : btn1Click
Nº WO......: 9432
Data.......: 22/03/2024
Responsável: Andre Imakawa
Descrição..: Alteração do \\FUNCEF.COM.BR\ARQUIVOS pasta Compartilhada
--------------------------------------------------------------------------------
Alteração  : btn1Click
Nº WO......: 8381
Data.......: 28/02/2024
Responsável: Andre Imakawa
Descrição..: Alteração do ALTARF para \\FUNCEF.COM.BR\ARQUIVOS
--------------------------------------------------------------------------------
CRIAÇÃO
--------------------------------------------------------------------------------
Pendência   : SIG 101465
Responsável : Ewerton Beltramini
Data        : 19/08/2021
Descrição   : Criação de form para Atualização /  Inclusão de dados do Historico
              de contribuição em Atraso.
--------------------------------------------------------------------------------}

unit FHistoricoDeContribuicaoEmAtraso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, Wwdatsrc, DBTables, Wwquery, Grids, Wwdbigrd, Wwdbgrid,
  fcButton, fcImgBtn, fcShapeBtn, StdCtrls, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, uMensErro, dBaseDados, UDataBase,
  SdfData, Spin, ADODB, ComObj;

type
  TFrmHistoricoDeContribuicaoEmAtraso = class(TfrmOkCancelar)
    lbl1: TLabel;
    pnl1: TPanel;
    lbl2: TLabel;
    btn1: TSpeedButton;
    edt1: TEdit;
    btn2: TBitBtn;
    btn3: TBitBtn;
    mmoArquivo1: TMemo;
    rgRgTipoOperacao1: TRadioGroup;
    ds: TwwDataSource;
    wqryUpdate: TwwQuery;
    wqryDel: TwwQuery;
    OpenDialog: TOpenDialog;
    qry: TwwQuery;
    btn4: TSpeedButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure rgRgTipoOperacao1Click(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    bLocalizado, bLocalizado2, bLocalizado3, bPlnCodigo: Boolean;

    function StrToFloatDef(const S: string; const Default: Extended): Extended;

  end;

var
  FrmHistoricoDeContribuicaoEmAtraso: TFrmHistoricoDeContribuicaoEmAtraso;

implementation

uses
  FPrincipal, UAdmPrev, USistema;
{$R *.DFM}

function TFrmHistoricoDeContribuicaoEmAtraso.StrToFloatDef(const S: string; const Default: Extended): Extended;
begin
  if not TextToFloat(PChar(S), Result, fvExtended) then
    Result := Default;
end;


procedure TFrmHistoricoDeContribuicaoEmAtraso.btn1Click(Sender: TObject);
var
  excel: variant;
begin
  inherited;
  //Abrindo o modelo salvo...
  excel := CreateOleObject('Excel.Application');
  excel.Visible := True;
  //excel.WorkBooks.Add('\\altarf\#altarf\GETIF_PUBLICO\COARI\Modelos\INSERT hstatrasocontrib.xlsx');              // Andre Imakawa - WO8381
  //excel.WorkBooks.Add('\\Funcef.com.br\arquivos\Planus\Documentos\COARI\Modelos\INSERT hstatrasocontrib.xlsx'); // Andre Imakawa - WO8381
  excel.WorkBooks.Add('\\Funcef.com.br\arquivos\PLANUS_COARI\Modelos\INSERT hstatrasocontrib.xlsx'); // Andre Imakawa - WO9432
end;

procedure TFrmHistoricoDeContribuicaoEmAtraso.btn2Click(Sender: TObject);
begin
  inherited;
  if OpenDialog.Execute then
    edt1.Text := OpenDialog.FileName;
end;

procedure TFrmHistoricoDeContribuicaoEmAtraso.btn3Click(Sender: TObject);
begin
  inherited;
  edt1.Clear;
  mmoArquivo1.Clear;
end;

procedure TFrmHistoricoDeContribuicaoEmAtraso.rgRgTipoOperacao1Click(Sender: TObject);
begin
  inherited;
  if RgrgTipoOperacao1.ItemIndex = 0 then
    bbtnConfirmar.Caption := '&Atualizar'
  else if RgrgTipoOperacao1.ItemIndex = 1 then
    bbtnConfirmar.Caption := '&Incluir';

  Application.ProcessMessages;
end;

procedure TFrmHistoricoDeContribuicaoEmAtraso.bbtnConfirmarClick(Sender: TObject);
var
  excel: variant;
  ilinha, icoluna, iContCampos, iIdLogTotalPREV: integer;
  bSair: boolean;

  sSqlAux, sSqlAux2, sSqlAux3, sSqlAux4, sSqlAux5, sSqlAux6, sSqlComando, sCodDoc, sPlnCodigo : String;

  //Variaveis para os novos valores importados...
  sMESREFERENCIA, sNUMRECEBIMENTO, sMESCOBRANCA, sIDMOTIVO, sVALOR, sCODALTERADOR, sFLGTIPO, sFLGRETROATIVO, sVALORRECEBIDO, sDATARECEBIMENTO, sNUMLANCTO: string;

  //Variaveis para os valores atuais na base...
  sMESREFERENCIA_antigo, sNUMRECEBIMENTO_antigo, sMESCOBRANCA_antigo, sIDMOTIVO_antigo, sVALOR_antigo, sCODALTERADOR_antigo, sFLGTIPO_antigo,
  sFLGRETROATIVO_antigo, sVALORRECEBIDO_antigo, sDATARECEBIMENTO_antigo: string;

  bFlgFazFinanceiro : Boolean;   // Paulo Nobre - WO24276

begin
  inherited;

  if RgrgTipoOperacao1.ItemIndex = -1 then
  begin
    MsgDlg('É necessário selecionar o Tipo da Operação (Atualização/Exclusão)!', 'Contribuição-Prev', mtWarning, [mbOK], 0);
    Exit;
  end;

  if (edt1.Text = '') then
  begin
    MsgDlg('É necessário selecionar o arquivo para carregar as informações.', 'Contribuição-Prev', mtWarning, [mbOK], 0);
    Exit;
  end;

  mmoArquivo1.Lines.Add('------------------------------------------------------------------------------------------------------------------------------------------------------------');
  mmoArquivo1.Lines.Add('Carregando os dados...');

  try

    excel := CreateOleObject('Excel.Application');
    excel.Visible := False;
    excel.WorkBooks.Add(OpenDialog.FileName);

    mmoArquivo1.Lines.Add('Lendo e processando os dados do arquivo informado...');

    StartTransacao;
    ilinha := 2;
    bSair := True;

    bFlgFazFinanceiro := False;   // Paulo Nobre - WO24276

    //if RgrgTipoOperacao1.ItemIndex = 0 then
    //begin
    while bSair do
    begin
     if excel.Cells.Item[ilinha, 1].Text <> '' then
     begin

       //Trantando os valores vindos do excel...
       sMESREFERENCIA     := Trim(excel.Cells.Item[ilinha, 1].Value);
       sNUMRECEBIMENTO    := Trim(excel.Cells.Item[ilinha, 2].Value);
       sMESCOBRANCA       := Trim(excel.Cells.Item[ilinha, 3].Value);
       sIDMOTIVO          := Trim(excel.Cells.Item[ilinha, 4].Value);
       if  (StrToIntDef(Trim(excel.Cells.Item[ilinha, 5].Value), 0) <> 0) or ((StrToFloatDef(Trim(excel.Cells.Item[ilinha, 5].Value), 0) <> 0)) then
          sVALOR           := StringReplace(StringReplace(FormatFloat('#.##', excel.Cells.Item[ilinha, 5].Value), '.', '', [rfReplaceAll]), ',', '.', [rfReplaceAll])
       else
          sVALOR           := Trim(excel.Cells.Item[ilinha, 5].Value);
       sCODALTERADOR      := Trim(excel.Cells.Item[ilinha, 6].Value);
       sFLGTIPO           := Trim(excel.Cells.Item[ilinha, 7].Value);
       sFLGRETROATIVO     := Trim(excel.Cells.Item[ilinha, 8].Value);
       if  (StrToIntDef(Trim(excel.Cells.Item[ilinha, 9].Value), 0) <> 0) or ((StrToFloatDef(Trim(excel.Cells.Item[ilinha, 9].Value), 0) <> 0)) then
          sVALORRECEBIDO   := StringReplace(StringReplace(FormatFloat('#.##', excel.Cells.Item[ilinha, 9].Value), '.', '', [rfReplaceAll]), ',', '.', [rfReplaceAll])
       else
          sVALORRECEBIDO   := Trim(excel.Cells.Item[ilinha, 9].Value);
       sDATARECEBIMENTO   := Trim(excel.Cells.Item[ilinha, 10].Value);
       sNUMLANCTO          := Trim(excel.Cells.Item[ilinha, 11].Value);

       iContCampos := 0;

       if Trim(sMESREFERENCIA)	   = '' then sMESREFERENCIA   := 'NULL' else inc(iContCampos);
       if Trim(sNUMRECEBIMENTO)	 = '' then sNUMRECEBIMENTO  := '0'    else inc(iContCampos);
       if Trim(sMESCOBRANCA)	     = '' then sMESCOBRANCA	    := 'NULL' else inc(iContCampos);
       if Trim(sIDMOTIVO)	       = '' then sIDMOTIVO	      := '0'    else inc(iContCampos);
       if Trim(sVALOR)		         = '' then sVALOR	          := '0'    else inc(iContCampos);
       if Trim(sCODALTERADOR)	   = '' then sCODALTERADOR    := '0'    else inc(iContCampos);
       if Trim(sFLGTIPO)	         = '' then sFLGTIPO	        := 'NULL' else inc(iContCampos);
       if Trim(sFLGRETROATIVO)	   = '' then sFLGRETROATIVO   := '0'    else inc(iContCampos);
       if Trim(sVALORRECEBIDO)	   = '' then sVALORRECEBIDO   := '0'    else inc(iContCampos);
       if Trim(sDATARECEBIMENTO)  = '' then sDATARECEBIMENTO := 'NULL' else inc(iContCampos);
       if Trim(sNUMLANCTO)        = '' then sNUMLANCTO        := '0'   else inc(iContCampos);


       if ((sNUMRECEBIMENTO <> '0') and
           (sIDMOTIVO <> '0') and
           (sMESCOBRANCA <> 'NULL') and
           (sMESREFERENCIA <> 'NULL') and
           (sCODALTERADOR <> '0') and
           (iContCampos > 0)) then
       begin

         // Paulo Nobre - WO24276 - Inicio
         //Procurando se já existe na tabela HSTATRASOCONTRIB....................................................................
         bLocalizado := False;
         wqryUpdate.Close;
         wqryUpdate.SQL.Clear;
         wqryUpdate.SQL.Add( ' Select MESREFERENCIA, NUMRECEBIMENTO, MESCOBRANCA, IDMOTIVO, VALOR, CODALTERADOR, FLGTIPO, FLGRETROATIVO, VALORRECEBIDO, DATARECEBIMENTO '
                           + ' from cm.HSTATRASOCONTRIB  '
                           + ' where NUMRECEBIMENTO = ' + sNUMRECEBIMENTO
                           + '       and IDMOTIVO = '       + sIDMOTIVO
                           + '       and MESCOBRANCA = '    + QuotedStr(sMESCOBRANCA)
                           + '       and MESREFERENCIA = '  + QuotedStr(sMESREFERENCIA)
                           + '       and CODALTERADOR = '   + sCODALTERADOR );
         wqryUpdate.Open;

         if not wqryUpdate.IsEmpty then
         begin
             bLocalizado := True;
             sMESREFERENCIA_antigo   := wqryUpdate.FieldByName('MESREFERENCIA').AsString;
             sNUMRECEBIMENTO_antigo  := wqryUpdate.FieldByName('NUMRECEBIMENTO').AsString;
             sMESCOBRANCA_antigo     := wqryUpdate.FieldByName('MESCOBRANCA').AsString;
             sIDMOTIVO_antigo        := wqryUpdate.FieldByName('IDMOTIVO').AsString;
             sVALOR_antigo           := StringReplace(StringReplace(FormatFloat('#.##', wqryUpdate.FieldByName('VALOR').AsFloat), '.', '', [rfReplaceAll]), ',', '.', [rfReplaceAll]);
             sCODALTERADOR_antigo    := wqryUpdate.FieldByName('CODALTERADOR').AsString;
             sFLGTIPO_antigo         := wqryUpdate.FieldByName('FLGTIPO').AsString;
             sFLGRETROATIVO_antigo   := wqryUpdate.FieldByName('FLGRETROATIVO').AsString;
             sVALORRECEBIDO_antigo   := StringReplace(StringReplace(FormatFloat('#.##', wqryUpdate.FieldByName('VALORRECEBIDO').AsFloat), '.', '', [rfReplaceAll]), ',', '.', [rfReplaceAll]);
             sDATARECEBIMENTO_antigo := wqryUpdate.FieldByName('DATARECEBIMENTO').AsString;
         end;
         wqryUpdate.Close;
         //......................................................................................................................

         //Verificando a HSTCONTRIBPREV..........................................................................................
         sCodDoc := '';
         bLocalizado2 := False;
         wqryUpdate.SQL.Clear;
         wqryUpdate.SQL.Add( ' Select  *'
                           + ' from cm.HSTCONTRIBPREV   '
                           + ' where NUMRECEBIMENTO = ' + sNUMRECEBIMENTO
                           + '       and IDMOTIVO = ' + sIDMOTIVO
                           + '       and MESCOBRANCA = ' + QuotedStr(sMESCOBRANCA)
                           + '       and MESREFERENCIA = ' + QuotedStr(sMESREFERENCIA)
                           + '       and SITRECEBIMENTO = 0 ' );
         wqryUpdate.Open;
         if not wqryUpdate.IsEmpty then
         begin
              bLocalizado2 := True;
              sCodDoc :=  wqryUpdate.FieldbyName('CODDOCUMENTOPREV').AsString;
         end;
         wqryUpdate.Close;
         //......................................................................................................................

         if (bFlgFazFinanceiro) Then
         Begin
            //Verificando a LANCTODOCUM.............................................................................................
            bLocalizado3 := False;
            if (sCodDoc <> '') then
            begin

               {   wqryUpdate.SQL.Clear;
                  wqryUpdate.SQL.Add( ' SELECT LC.*, D.STATUS, D.DATAVENCTO '
                                    + ' FROM LANCTODOCUM LC  '
                                    + ' INNER JOIN DOCUMENTO D ON LC.CODDOCUMENTO = D.CODDOCUMENTO '
                                    + ' WHERE LC.CODDOCUMENTO = '  + sCodDoc
                                    + ' AND LC.CODALTERADOR = '    + sCODALTERADOR);
                  if sNUMLANCTO <> '0' then
                     wqryUpdate.SQL.Add(' AND LC.NUMLANCTO = '       + sNUMLANCTO);
                  wqryUpdate.Open;          }

                  wqryUpdate.SQL.Clear;
                  wqryUpdate.SQL.Add( ' SELECT D.CODDOCUMENTO, D.STATUS FROM DOCUMENTO D WHERE D.CODDOCUMENTO = '  + sCodDoc );
                  wqryUpdate.Open;

                  if not wqryUpdate.IsEmpty then
                  begin
                       //Se baixado, não pode...
                       bLocalizado3 := True;
                       if (wqryUpdate.FieldByName('STATUS').AsString = '2') then
                       begin
{                          mmoArquivo1.Lines.Add('--> O Documento (' + wqryUpdate.FieldByName('CODDOCUMENTO').AsString  +
                                                ') já foi Baixado! O Registro não pode ser processado.' + ' (' + Trim(excel.Cells.Item[ilinha, 1].text) + ')'
                                                                                                        + ' (' + Trim(excel.Cells.Item[ilinha, 2].text) + ')'
                                                                                                        + ' (' + Trim(excel.Cells.Item[ilinha, 3].text) + ')'
                                                                                                        + ' (' + Trim(excel.Cells.Item[ilinha, 4].text) + ')'
                                                                                                        + ' (' + Trim(excel.Cells.Item[ilinha, 6].text) + ')'
                                                                                                        + ' (' + Trim(excel.Cells.Item[ilinha, 11].text) + ')' );     }

                          mmoArquivo1.Lines.Add('--> O Documento (' + wqryUpdate.FieldByName('CODDOCUMENTO').AsString + ') já foi Baixado, portanto não será atualizado...');

                          bLocalizado3 := False;
                          exit;
                       end;

                       //Se PLNCODIGO preenchido, tem que alterar os valores nas tabelas lancamento e planilha.
                       bPlnCodigo := False;
                       sPlnCodigo := wqryUpdate.FieldByName('PLNCODIGO').AsString;
                       if (wqryUpdate.FieldByName('PLNCODIGO').AsString <> '') then
                       begin
                             bPlnCodigo := True;
                          (*
                              mmoArquivo1.Lines.Add('--> O registro já foi contabilizado! Não é posivel alterá-lo. (' + Trim(excel.Cells.Item[ilinha, 2].text) + ')'
                                                                                                               + ' (' + Trim(excel.Cells.Item[ilinha, 4].text) + ')'
                                                                                                               + ' (' + Trim(excel.Cells.Item[ilinha, 3].text) + ')'
                                                                                                               + ' (' + Trim(excel.Cells.Item[ilinha, 1].text) + ')'
                                                                                                               + ' (' + Trim(excel.Cells.Item[ilinha, 6].text) + ')');
                              bLocalizado3 := False;
                              exit;
                          *)
                       end;

                  end;
                  wqryUpdate.Close;
            end;
         end;
         //......................................................................................................................

         // Paulo Nobre - WO24276 - Fim

         wqryUpdate.SQL.Clear;
         sSqlComando := '';
         sSqlAux  := '';
         sSqlAux2 := '';
         sSqlAux3 := '';
         sSqlAux4 := '';
         sSqlAux5 := '';
         sSqlAux6 := '';

         if (RgrgTipoOperacao1.ItemIndex = 0) and (bLocalizado2 = True) then     // Alteração - Paulo Nobre - WO24276
         begin
            if bLocalizado  then sSqlAux  := ' update HSTATRASOCONTRIB set NUMRECEBIMENTO = NUMRECEBIMENTO ';
        //    if bLocalizado2 then sSqlAux2 := ' update HSTCONTRIBPREV set NUMRECEBIMENTO = NUMRECEBIMENTO ';     Paulo Nobre - WO24276

            // Paulo Nobre - WO24276 - Inicio
            if (bFlgFazFinanceiro) Then
            Begin
               if bLocalizado3 then
                  sSqlAux3 := ' update LANCTODOCUM set CODDOCUMENTO = CODDOCUMENTO ';

               if bPlnCodigo then
                  sSqlAux4 := ''; sSqlAux5 := ''; sSqlAux6 := '';
            End;
            // Paulo Nobre - WO24276 - Fim

            //----------------------------------------------------------------------------------------------------------------

            sSqlComando := 'Tabela: HSTATRASOCONTRIB: ';
            if (sVALOR <> '0') then
            begin
                 if (UpperCase(sVALOR) = 'NULO') then
                    sVALOR := '0'; // Caso o campo seja preenchido com a palavra " NULO "  limpa o campo

                 sSqlAux := sSqlAux + ' ,VALOR    = ' + sVALOR;
                 sSqlComando := sSqlComando + ' VALOR_novo=' + sVALOR + ' VALOR_antigo= ' + sVALOR_antigo;

                 //Paulo Nobre - WO24276 - Inicio

         {       if bLocalizado2 then
                 begin
                      if sVALOR <> '0' then
                        sSqlAux2 := sSqlAux2 + ' ,VALORESPERADO    =  (VALORESPERADO  + ' + sVALOR + ')'
                                             + ' ,VALORCALCULADO   =  (VALORCALCULADO + ' + sVALOR + ')'
                      else
                        sSqlAux2 := sSqlAux2 + ' ,VALORESPERADO    =  ' + sVALOR
                                             + ' ,VALORCALCULADO   =  ' + sVALOR;
                 end;         }

                 if (bFlgFazFinanceiro) Then
                 begin
                    if bLocalizado3 then
                       sSqlAux3 := sSqlAux3 + ' ,VALOR  = ' + sVALOR;

                    if bPlnCodigo then //(sVALOR <> sVALOR_antigo) then
                    begin
                       // Atualizando a Contabilidade
                       sSqlAux4 := ' update lancamento set LACVALOR = ' + sVALOR        +
                                   ' where PLNCODIGO = '                + sPlnCodigo    +
                                   '   and (    (CODDOCUMENTO = '       + sCodDoc + ')' +
                                   '         or (LACNUMDOC like '       + QuotedStr('%' + sCodDoc + '%') + ')' +
                                   '         or (LACHIST1 like '        + QuotedStr('%' + sCodDoc + '%') + ')    )' ;
                              //     '   and LACVALOR = '                 + sVALOR_antigo;

                       sSqlAux5 := ' update planilha set PLNTOTDEB = '  + sVALOR        + ',' +
                                   '                     PLNTOTCRE = '  + sVALOR        +
                                   ' where PLNCODIGO = '                + sPlnCodigo;

                       // Atualizando o Contas a Receber
                       sSqlAux6 := ' update LANCTODOCUM set VALOR = ' + sVALOR + ',' +
                                   '                        VLRLIQUIDO = ' + sVALOR +
                                   ' where CODDOCUMENTO = ' +  sCodDoc        +
//                                      '       and CODALTERADOR = ' +  sCODALTERADOR  +
//                                      '       and PLNCODIGO = '    +  sPlnCodigo
                                   '       and NUMLANCTO = ' +  sNUMLANCTO;
                    end;
                 end;
                 // Paulo Nobre - WO24276 - Fim
            end;

            if (sFLGTIPO <> 'NULL') then
            begin
                 if (UpperCase(sFLGTIPO) = 'NULO') then
                    sFLGTIPO := '0'; //Caso o campo seja preenchido com a palavra " NULO "  limpa o campo

                 sSqlAux := sSqlAux + ' ,FLGTIPO    = ' + QuotedStr(sFLGTIPO);
                 sSqlComando := sSqlComando + ' FLGTIPO_novo=' + sFLGTIPO + ' FLGTIPO_antigo= ' + sFLGTIPO_antigo;
            end;

            if (sFLGRETROATIVO <> '0') then
            begin
                 if (UpperCase(sFLGRETROATIVO) = 'NULO') then
                    sFLGRETROATIVO := '0'; //Caso o campo seja preenchido com a palavra " NULO "  limpa o campo

                 sSqlAux := sSqlAux + ' ,FLGRETROATIVO     = ' + sFLGRETROATIVO;
                 sSqlComando := sSqlComando + ' FLGRETROATIVO_novo=' + sFLGRETROATIVO + ' FLGRETROATIVO_antigo= ' + sFLGRETROATIVO_antigo;
            end;

            if (sVALORRECEBIDO <> '0') then
            begin
                 if (UpperCase(sVALORRECEBIDO) = 'NULO') then
                    sVALORRECEBIDO := '0'; //Caso o campo seja preenchido com a palavra " NULO "  limpa o campo

                 sSqlAux := sSqlAux + ' ,VALORRECEBIDO    = ' + sVALORRECEBIDO;
                 sSqlComando := sSqlComando + ' VALORRECEBIDO_novo=' + sVALORRECEBIDO + ' VALORRECEBIDO_antigo= ' + sVALORRECEBIDO_antigo;
            end;

            if (sDATARECEBIMENTO <> 'NULL') then
            begin
                 if (UpperCase(sDATARECEBIMENTO) = 'NULO') then
                    sDATARECEBIMENTO := '0'; //Caso o campo seja preenchido com a palavra " NULO "  limpa o campo

                 sSqlAux := sSqlAux + ' ,DATARECEBIMENTO    = ' + QuotedStr(sDATARECEBIMENTO);
                 sSqlComando := sSqlComando + ' DATARECEBIMENTO_novo=' + sDATARECEBIMENTO + ' DATARECEBIMENTO_antigo= ' + sDATARECEBIMENTO_antigo;
            end;

            if bLocalizado then
            begin
               sSqlAux := sSqlAux + ' where NUMRECEBIMENTO = ' + sNUMRECEBIMENTO
                                  + ' and IDMOTIVO = ' + sIDMOTIVO
                                  + ' and MESCOBRANCA = ' + QuotedStr(sMESCOBRANCA)
                                  + ' and MESREFERENCIA = ' +  QuotedStr(sMESREFERENCIA)
                                  + ' and CODALTERADOR = ' +  sCODALTERADOR;
            end;

            // Paulo Nobre - WO24276 - Inicio

      {      if bLocalizado2 then
            begin
               sSqlAux2 := sSqlAux2 + ' where NUMRECEBIMENTO = ' + sNUMRECEBIMENTO
                                    + ' and IDMOTIVO = ' + sIDMOTIVO
                                    + ' and MESCOBRANCA = ' + QuotedStr(sMESCOBRANCA)
                                    + ' and MESREFERENCIA = ' +  QuotedStr(sMESREFERENCIA);

               sSqlComando := sSqlComando + 'Tabela: HSTCONTRIBPREV:  VALORESPERADO_novo = (VALORESPERADO - ' + sVALOR + ')'
                                        + ' VALORCALCULADO_novo = (VALORCALCULADO - ' + sVALOR + ')';
            end;      }

            if (bFlgFazFinanceiro) Then
            Begin
               if bLocalizado3 then
               begin
                  sSqlAux3 := sSqlAux3 + ' where CODDOCUMENTO = ' + sCodDoc
                                       + ' and CODALTERADOR = ' +  sCODALTERADOR;

                  if sNUMLANCTO <> '0' then
                     sSqlAux3 := sSqlAux3 + ' and NUMLANCTO = ' + sNUMLANCTO;

                  sSqlComando := sSqlComando + 'Tabela: LANCTODOCUM:  VALOR_novo = ' + sVALOR + ')';
               end;
            end;
            // Paulo Nobre - WO24276 - Fim

         end
         //else if (RgrgTipoOperacao1.ItemIndex = 1) and (bLocalizado2 = False) then // Inserção - Paulo Nobre - WO24276 //WO27740 Leandro
         else if (RgrgTipoOperacao1.ItemIndex = 1) and (bLocalizado2 = True) then  //WO27740 Leandro
         begin
            sSqlAux := ' insert into HSTATRASOCONTRIB ( NUMRECEBIMENTO, IDMOTIVO, MESCOBRANCA, MESREFERENCIA, CODALTERADOR ';

            if (sVALOR	         <> '0')    or (sVALOR	        = 'NULO') then sSqlAux := sSqlAux + ', VALOR'          ;
            if (sFLGTIPO	       <> 'NULL') or (sFLGTIPO	     = 'NULO') then sSqlAux := sSqlAux + ', FLGTIPO'        ;
            if (sFLGRETROATIVO   <> '0')    or (sFLGRETROATIVO   = 'NULO') then sSqlAux := sSqlAux + ', FLGRETROATIVO'  ;
            if (sVALORRECEBIDO   <> '0')    or (sVALORRECEBIDO   = 'NULO') then sSqlAux := sSqlAux + ', VALORRECEBIDO'  ;
            if (sDATARECEBIMENTO <> 'NULL') or (sDATARECEBIMENTO = 'NULO') then sSqlAux := sSqlAux + ', DATARECEBIMENTO';

            sSqlAux := sSqlAux + ' ) values ( ';

            sSqlAux := sSqlAux + sNUMRECEBIMENTO + ', ' + sIDMOTIVO + ', ' + QuotedStr(sMESCOBRANCA) + ', ' + QuotedStr(sMESREFERENCIA) + ', ' + sCODALTERADOR;

            if (sVALOR <> '0') then
            begin
                 if (UpperCase(sVALOR) = 'NULO') then sVALOR := '0'; //Caso o campo seja preenchido com a palavra " NULO "  limpa o campo
                 sSqlAux := sSqlAux + ' ,' + sVALOR;
                 sSqlComando := sSqlComando + ' VALOR_novo=' + sVALOR + ' VALOR_antigo= ' + sVALOR_antigo;
            end;

            if (sFLGTIPO <> 'NULL') then
            begin
                 if (UpperCase(sFLGTIPO) = 'NULO') then sFLGTIPO := '0'; //Caso o campo seja preenchido com a palavra " NULO "  limpa o campo
                 sSqlAux := sSqlAux + ' ,' + QuotedStr(sFLGTIPO);
                 sSqlComando := sSqlComando + ' FLGTIPO_novo=' + sFLGTIPO + ' FLGTIPO_antigo= ' + sFLGTIPO_antigo;
            end;

            if (sFLGRETROATIVO <> '0') then
            begin
                 if (UpperCase(sFLGRETROATIVO) = 'NULO') then sFLGRETROATIVO := '0'; //Caso o campo seja preenchido com a palavra " NULO "  limpa o campo
                 sSqlAux := sSqlAux + ' ,' + sFLGRETROATIVO;
                 sSqlComando := sSqlComando + ' FLGRETROATIVO_novo=' + sFLGRETROATIVO + ' FLGRETROATIVO_antigo= ' + sFLGRETROATIVO_antigo;
            end;

            if (sVALORRECEBIDO <> '0') then
            begin
                 if (UpperCase(sVALORRECEBIDO) = 'NULO') then sVALORRECEBIDO := '0'; //Caso o campo seja preenchido com a palavra " NULO "  limpa o campo
                 sSqlAux := sSqlAux + ' ,' + sVALORRECEBIDO;
                 sSqlComando := sSqlComando + ' VALORRECEBIDO_novo=' + sVALORRECEBIDO + ' VALORRECEBIDO_antigo= ' + sVALORRECEBIDO_antigo;
            end;

            if (sDATARECEBIMENTO <> 'NULL') then
            begin
                 if (UpperCase(sDATARECEBIMENTO) = 'NULO') then sDATARECEBIMENTO := '0'; //Caso o campo seja preenchido com a palavra " NULO "  limpa o campo
                 sSqlAux := sSqlAux + ' ,' + QuotedStr(sDATARECEBIMENTO);
                 sSqlComando := sSqlComando + ' DATARECEBIMENTO_novo=' + sDATARECEBIMENTO + ' DATARECEBIMENTO_antigo= ' + sDATARECEBIMENTO_antigo;
            end;

            sSqlAux := sSqlAux + ')';
         end
         else
         begin
            if (RgrgTipoOperacao1.ItemIndex = 0) and (bLocalizado2 = False) then     // Paulo Nobre - WO24276
               mmoArquivo1.Lines.Add('--> Registro não localizado para Atualização: (' + Trim(excel.Cells.Item[ilinha, 1].text) + ')'
                                                                             + ' (' + Trim(excel.Cells.Item[ilinha, 2].text) + ')'
                                                                             + ' (' + Trim(excel.Cells.Item[ilinha, 3].text) + ')'
                                                                             + ' (' + Trim(excel.Cells.Item[ilinha, 4].text) + ')'
                                                                             + ' (' + Trim(excel.Cells.Item[ilinha, 6].text) + ')' );

            if (RgrgTipoOperacao1.ItemIndex = 1) and (bLocalizado = True) then
               mmoArquivo1.Lines.Add('--> O Registro já existe: (' + Trim(excel.Cells.Item[ilinha, 1].text) + ')'
                                                         + ' (' + Trim(excel.Cells.Item[ilinha, 2].text) + ')'
                                                         + ' (' + Trim(excel.Cells.Item[ilinha, 3].text) + ')'
                                                         + ' (' + Trim(excel.Cells.Item[ilinha, 4].text) + ')'
                                                         + ' (' + Trim(excel.Cells.Item[ilinha, 6].text) + ')' );
         end;

         if (sSqlAux <> '') and (bLocalizado2 = True) then        // Paulo Nobre - WO24276
         try
            wqryUpdate.SQL.Text := sSqlAux;
            wqryUpdate.ExecSql;
            if wqryUpdate.RowsAffected > 0 then
            begin

               mmoArquivo1.Lines.Add('--> Registro alterado/inserido com sucesso: (' + Trim(excel.Cells.Item[ilinha, 1].text) + ')'
                                                                             + ' (' + Trim(excel.Cells.Item[ilinha, 2].text) + ')'
                                                                             + ' (' + Trim(excel.Cells.Item[ilinha, 3].text) + ')'
                                                                             + ' (' + Trim(excel.Cells.Item[ilinha, 4].text) + ')'
                                                                             + ' (' + Trim(excel.Cells.Item[ilinha, 6].text) + ')' );

              sSqlComando := 'Alt.Hist.Reser.lote: ' + sSqlComando;

              wqryUpdate.Close;
              iIdLogTotalPREV := LeUltRegistro(nil, 'LOGTOTALPREV');
              wqryUpdate.SQL.Text := 'INSERT INTO LOGTOTALPREV ' + #13 + '( ' + #13 + 'IDLOGTOTALPREV, IDMODULO, DESCOPERACAO, IDPESQUISA1, IDUSUARIO, DATA ' + #13 + ') ' + #13
                                   + 'VALUES ' + #13 + '(' + IntToStr(iIdLogTotalPREV) + ', ' + IntToStr(Sistema.IdModulo) + ', ' + '''' + sSqlComando + ''', '
                                   + sNUMRECEBIMENTO + '-' + sIDMOTIVO + '-' + sMESCOBRANCA + '-' + sMESREFERENCIA + '-' + sCODALTERADOR + ', ' + IntToStr(Sistema.IdUsuario) + ', ' + ' SYSDATE ' + #13 + ') ';
              wqryUpdate.ExecSql;


              if sSqlAux2 <> '' then
              begin
                   wqryUpdate.Close;
                   wqryUpdate.SQL.Clear;
                   wqryUpdate.SQL.Text := sSqlAux2;
                   wqryUpdate.ExecSql;
              end;

              if sSqlAux3 <> '' then
              begin
                   wqryUpdate.Close;
                   wqryUpdate.SQL.Clear;
                   wqryUpdate.SQL.Text := sSqlAux3;
                   wqryUpdate.ExecSql;
              end;

              // Paulo Nobre - WO24276 - Inicio
              if (bFlgFazFinanceiro) Then
              Begin
                 if sSqlAux4 <> '' then
                 begin
                      wqryUpdate.Close;
                      wqryUpdate.SQL.Clear;
                      wqryUpdate.SQL.Text := sSqlAux4;
                      wqryUpdate.ExecSql;
                 end;

                 if sSqlAux5 <> '' then
                 begin
                      wqryUpdate.Close;
                      wqryUpdate.SQL.Clear;
                      wqryUpdate.SQL.Text := sSqlAux5;
                      wqryUpdate.ExecSql;
                 end;

                 if sSqlAux6 <> '' then
                 begin
                      wqryUpdate.Close;
                      wqryUpdate.SQL.Clear;
                      wqryUpdate.SQL.Text := sSqlAux6;
                      wqryUpdate.ExecSql;
                 end;
              end;
              // Paulo Nobre - WO24276 - Fim

            end
            else
              mmoArquivo1.Lines.Add('--> Registro não localizado: (' + Trim(excel.Cells.Item[ilinha, 1].text) + ')'
                                                              + ' (' + Trim(excel.Cells.Item[ilinha, 2].text) + ')'
                                                              + ' (' + Trim(excel.Cells.Item[ilinha, 3].text) + ')'
                                                              + ' (' + Trim(excel.Cells.Item[ilinha, 4].text) + ')'
                                                              + ' (' + Trim(excel.Cells.Item[ilinha, 6].text) + ')' );
         except
           on E: Exception do
           begin
              mmoArquivo1.Lines.Add('--> Erro ao alterar/incluir o registro: (' + ' (' + Trim(excel.Cells.Item[ilinha, 1].text) + ')'
                                                                                + ' (' + Trim(excel.Cells.Item[ilinha, 2].text) + ')'
                                                                                + ' (' + Trim(excel.Cells.Item[ilinha, 3].text) + ')'
                                                                                + ' (' + Trim(excel.Cells.Item[ilinha, 4].text) + ')'
                                                                                + ' (' + Trim(excel.Cells.Item[ilinha, 6].text) + ')'
                                                                                + 'Erro: ' + E.Message);
           end;
         end;
       end
       else
       begin
          mmoArquivo1.Lines.Add('--> Não é possível realizar a alteração/inclusão:' + #13 + 'Erro no preenchimento das colunas obrigatórias.' + #13
                                                                                     + ' ( MESREFERENCIA: ' + Trim(excel.Cells.Item[ilinha, 1].text) + ')'
                                                                                     + ' ( MESCOBRANCA: ' + Trim(excel.Cells.Item[ilinha, 2].text) + ')'
                                                                                     + ' ( NUMRECEBIMENTO: ' + Trim(excel.Cells.Item[ilinha, 3].text) + ')'
                                                                                     + ' ( IDMOTIVO: ' + Trim(excel.Cells.Item[ilinha, 4].text) + ')'
                                                                                     + ' ( CODLATERADOR: ' + Trim(excel.Cells.Item[ilinha, 6].text) + ')' );
       end;

       ilinha := ilinha + 1;

     end
     else
         bSair := False;
    end;

    dtmBaseDados.dbBaseDados.Commit;

    mmoArquivo1.Lines.Add('Processo finalizado! ' + 'Total de linhas Processadas: ' + IntToStr(ilinha - 2));
    mmoArquivo1.Lines.Add('------------------------------------------------------------------------------------------------------------------------------------------------------------');
    excel.Quit;
    excel := Unassigned;
  Except
    dtmBaseDados.dbBaseDados.Rollback;
    excel.Quit;
    excel := Unassigned;
    btn3.Click;
  End;
end;

procedure TFrmHistoricoDeContribuicaoEmAtraso.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  edt1.Clear;
  mmoArquivo1.Clear;
end;

procedure TFrmHistoricoDeContribuicaoEmAtraso.btn4Click(Sender: TObject);
begin
  inherited;
  MsgDlg('Dicas de preenchimento do modelo: ' + #13 + #13 +
         '   --> Os campos destacados em vermelho são de preenchimento obrigatório e não devem ser alterados;' + #13 +
         '   --> Para apagar o valor de qualquer campo, basta preencher o campo com a palavra chave: "NULO";' + #13 +
         '   --> Os campos deixados em branco, zerados ou vazios, não serão considerados, e ficarão inalterados na atualização;'
         , 'Contribuição-Prev', mtInformation, [mbOK], 0);
end;

procedure TFrmHistoricoDeContribuicaoEmAtraso.FormShow(Sender: TObject);
begin
  inherited;
  rgRgTipoOperacao1Click(Sender);
end;

end.
