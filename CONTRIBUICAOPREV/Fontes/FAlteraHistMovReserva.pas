unit FAlteraHistMovReserva;

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//----------------------------------------------------------------------------------------
//Alteração  : btn1Click
//Nº WO......: 9432
//Data.......: 22/03/2024
//Responsável: Andre Imakawa
//Descrição..: Alteração do \\FUNCEF.COM.BR\ARQUIVOS pasta Compartilhada
//----------------------------------------------------------------------------------------
//Alteração  : btn1Click
//Nº WO......: 8381
//Data.......: 28/02/2024
//Responsável: Andre Imakawa
//Descrição..: Alteração do ALTARF para \\FUNCEF.COM.BR\ARQUIVOS
//----------------------------------------------------------------------------------------
//Solicitãção : 101465
//Responsável : Ewerton Beltramini
//Data        : 17/08/2021
//Descrição   : Considerar campos IDPESSOA, IDPARTICIPANTE, MESREFERENCIA, IDCONTRIBUICAO,
//               na alteração historico de reserva em lote
//----------------------------------------------------------------------------------------
//Solicitãção : 117204
//Responsável : Edilaine
//Data        : 29/06/2021
//Descrição   : Considerar campo IDTIPORESERVA na alteração historico de reserva em lote
//----------------------------------------------------------------------------------------


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, Wwdatsrc, DBTables, Wwquery, Grids, Wwdbigrd, Wwdbgrid,
  fcButton, fcImgBtn, fcShapeBtn, StdCtrls, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, uMensErro,dBaseDados, UDataBase,
  SdfData, Spin, ADODB, ComObj;

type
  TFrmAlteraHistMovReserva = class(TfrmOkCancelar)
    
   
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
    QryImpAux: TwwQuery;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure rgRgTipoOperacao1Click(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    //procedure mmoArquivo1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAlteraHistMovReserva: TFrmAlteraHistMovReserva;

implementation
  uses FPrincipal, UAdmPrev,USistema;
{$R *.DFM}

procedure TFrmAlteraHistMovReserva.btn1Click(Sender: TObject);
var excel :variant;
begin
  inherited;
      Excel := CreateOleObject('Excel.Application');
      Excel.Visible := True;
      //Excel.WorkBooks.Add('\\altarf\#altarf\GETIF_PUBLICO\COARI\Modelos\Alteracao Historico de Reserva.xlsx');                // Andre Imakawa - WO8381
      //Excel.WorkBooks.Add('\\Funcef.com.br\arquivos\Planus\Documentos\COARI\Modelos\Alteracao Historico de Reserva.xlsx');   // Andre Imakawa - WO8381
      Excel.WorkBooks.Add('\\Funcef.com.br\arquivos\PLANUS_COARI\Modelos\Alteracao Historico de Reserva.xlsx');   // Andre Imakawa - WO9432
end;

procedure TFrmAlteraHistMovReserva.btn2Click(Sender: TObject);
begin
  inherited;
   if OpenDialog.Execute then
     edt1.Text := OpenDialog.FileName;
end;

procedure TFrmAlteraHistMovReserva.btn3Click(Sender: TObject);
begin
  inherited;
  edt1.Clear;
  mmoArquivo1.Clear;
end;

procedure TFrmAlteraHistMovReserva.rgRgTipoOperacao1Click(Sender: TObject);
begin
  inherited;
   if RgrgTipoOperacao1.ItemIndex = 0 then
       bbtnConfirmar.Caption    := '&Atualizar'
    else if RgrgTipoOperacao1.ItemIndex = 1 then
       bbtnConfirmar.Caption    := '&Excluir';

       Application.ProcessMessages;
end;

procedure TFrmAlteraHistMovReserva.bbtnConfirmarClick(Sender: TObject);
var
excel :variant;
ilinha,icoluna, iContCampos,iIdLogTotalPREV : integer;
bSair : boolean;
sIDHISTRESERVA,	sVLRREAL,sVLRCOTAS,sVALORINDICE,sDATARECEBIMENTO,sFLGENTRADA,sDATAALIMENTACAO, sSqlAux, sSqlComando : String;
sIDHISTRESERVA_antigo,	sVLRREAL_antigo,sVLRCOTAS_antigo,sVALORINDICE_antigo,sDATARECEBIMENTO_antigo,sFLGENTRADA_antigo : String;
sDATAALIMENTACAO_antigo: String;
sIDTIPORESERVA, sIDTIPORESERVA_antigo : string;   //edilaine - SIG117204

//Ewerton Beltramini - SIG 101465 - 17/08/2021 - inicio...
sIDPESSOA,	sIDPARTICIPANTE,	sMESREFERENCIA,	sIDCONTRIBUICAO : string;
sIDPESSOA_antigo,	sIDPARTICIPANTE_antigo,	sMESREFERENCIA_antigo, sIDCONTRIBUICAO_antigo : string;
//Ewerton Beltramini - SIG 101465 - 17/08/2021 - Fim.


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


  mmoArquivo1.Lines.Add('Carregando os dados...');



  try
    
      Excel := CreateOleObject('Excel.Application');
      Excel.Visible := False;
      Excel.WorkBooks.Add(OpenDialog.FileName);

      mmoArquivo1.Lines.Add('Lendo e processando os dados do arquivo informado...');

      StartTransacao;
      iLinha := 2;
      bSair := True;

      if RgrgTipoOperacao1.ItemIndex = 0 then
      begin
            while bSair do
            begin
                    if Excel.Cells.Item[ilinha,1].Text <> '' then
                    begin
                          //Trantando os valores vindos do excel...
                          sIDHISTRESERVA   := Excel.Cells.Item[ilinha,1].Value;
                          sVLRREAL         := StringReplace(StringReplace(FormatFloat('#.##', Excel.Cells.Item[ilinha,2].Value),'.','',[rfReplaceAll]),',','.',[rfReplaceAll]);
                          sVLRCOTAS        := StringReplace(StringReplace(FormatFloat('#.##############', Excel.Cells.Item[ilinha,3].Value),'.','',[rfReplaceAll]),',','.',[rfReplaceAll]);
                          sVALORINDICE     := StringReplace(StringReplace(FormatFloat('#.################', Excel.Cells.Item[ilinha,4].Value),'.','',[rfReplaceAll]),',','.',[rfReplaceAll]);
                          sDATARECEBIMENTO := Excel.Cells.Item[ilinha,5].Value;
                          sFLGENTRADA      := Excel.Cells.Item[ilinha,6].Value ;
                          sDATAALIMENTACAO := Excel.Cells.Item[ilinha,7].Value;
                          sIDTIPORESERVA   := Excel.Cells.Item[ilinha,8].Value;   //edilaine - SIG117204

                          //Ewerton Beltramini - SIG 101465 - 17/08/2021 - inicio...
                          sIDPESSOA        := Excel.Cells.Item[ilinha,9].Value;
                          sIDPARTICIPANTE  := Excel.Cells.Item[ilinha,10].Value;
                          sMESREFERENCIA   := Excel.Cells.Item[ilinha,11].Value;
                          sIDCONTRIBUICAO  := Excel.Cells.Item[ilinha,12].Value;
                          //Ewerton Beltramini - SIG 101465 - 17/08/2021 - Fim.

                          iContCampos:= 0;

                          if sIDHISTRESERVA    = ''  then  sIDHISTRESERVA   := '0';             
                          if sVLRREAL     = ''  then  sVLRREAL    := 'NULL' else inc(iContCampos);
                          if sVLRCOTAS       = ''  then  sVLRCOTAS      := 'NULL' else inc(iContCampos);
                          if sVALORINDICE          = ''  then  sVALORINDICE         := 'NULL'    else inc(iContCampos);
                          if sDATARECEBIMENTO          = ''  then  sDATARECEBIMENTO         := 'NULL'    else inc(iContCampos);
                          if sFLGENTRADA     = ''  then  sFLGENTRADA    := 'NULL'    else inc(iContCampos);
                          if sDATAALIMENTACAO   = ''  then  sDATAALIMENTACAO  := 'NULL' else inc(iContCampos);
                          if sIDTIPORESERVA  = '' then sIDTIPORESERVA := 'NULL' else inc(iContCampos);   //edilaine - SIG117204

                          //Ewerton Beltramini - SIG 101465 - 17/08/2021 - inicio...
                          if sIDPESSOA  = '' then sIDPESSOA := 'NULL' else inc(iContCampos);
                          if sIDPARTICIPANTE  = '' then sIDPARTICIPANTE := 'NULL' else inc(iContCampos);
                          if sMESREFERENCIA  = '' then sMESREFERENCIA := 'NULL' else inc(iContCampos);
                          if sIDCONTRIBUICAO  = '' then sIDCONTRIBUICAO := 'NULL' else inc(iContCampos);
                          //Ewerton Beltramini - SIG 101465 - 17/08/2021 - Fim.

                          if (sIDHISTRESERVA <> '0') and (iContCampos > 0) then
                          begin

                              wqryUpdate.Close;
                              wqryUpdate.SQL.Clear;
                              wqryUpdate.SQL.Add(' select VLRREAL,VLRCOTAS,VALORINDICE,DATARECEBIMENTO,FLGENTRADA,DATAALIMENTACAO, '+
                                                 '        IDTIPORESERVA '+    //edilaine SIg117204
                                                 '        , IDPESSOA, IDPARTICIPANTE, IDCONTRIBUICAO, MESREFERENCIA ' + //Ewerton Beltramini - SIG 101465 - 17/08/2021
                                                 '   from cm.HISTMOVRESERVA h where h.IDHISTRESERVA=  '+ sIDHISTRESERVA);
                              wqryUpdate.Open;

                             if not wqryUpdate.IsEmpty then
                             begin
                                  sVLRREAL_antigo := wqryUpdate.FieldByName('VLRREAL').AsString;
                                  sVLRCOTAS_antigo := wqryUpdate.FieldByName('VLRCOTAS').AsString;
                                  sVALORINDICE_antigo := wqryUpdate.FieldByName('VALORINDICE').AsString;
                                  sDATARECEBIMENTO_antigo := wqryUpdate.FieldByName('DATARECEBIMENTO').AsString;
                                  sFLGENTRADA_antigo:= wqryUpdate.FieldByName('FLGENTRADA').AsString;
                                  sDATAALIMENTACAO_antigo:= wqryUpdate.FieldByName('DATAALIMENTACAO').AsString;
                                  sIDTIPORESERVA_antigo := wqryUpdate.FieldByName('IDTIPORESERVA').AsString;;   //edilaine - SIG117204

                                  //Ewerton Beltramini - SIG 101465 - 17/08/2021 - inicio...
                                  sIDPESSOA_antigo       := wqryUpdate.FieldByName('IDPESSOA').AsString;
                                  sIDPARTICIPANTE_antigo := wqryUpdate.FieldByName('IDPARTICIPANTE').AsString;
                                  sMESREFERENCIA_antigo  := wqryUpdate.FieldByName('MESREFERENCIA').AsString;
                                  sIDCONTRIBUICAO_antigo := wqryUpdate.FieldByName('IDCONTRIBUICAO').AsString;
                                  //Ewerton Beltramini - SIG 101465 - 17/08/2021 - Fim.
                             end;

                              sSqlAux := '';
                              sSqlComando:='';
                              wqryUpdate.Close;
                              sSqlAux := ' update histmovreserva set ';
                              sSqlAux := sSqlAux + ' IDHISTRESERVA    = ' + sIDHISTRESERVA;

                              if (sVLRREAL    <> 'NULL') then
                              begin
                              sSqlAux := sSqlAux + ' ,VLRREAL    = ' + sVLRREAL;
                              sSqlComando:=sSqlComando+' VLRREAL_novo='+sVLRREAL  + ' VLRREAL_antigo: '+ sVLRREAL_antigo;
                              end;

                              if (sVLRCOTAS      <> 'NULL') then
                              begin
                               sSqlAux := sSqlAux + ' ,VLRCOTAS      = ' + sVLRCOTAS;
                               sSqlComando:=sSqlComando + ' VLRCOTAS_novo='+sVLRCOTAS + ' VLRCOTAS_antigo = '+ sVLRCOTAS_antigo;
                              end;

                              if (sVALORINDICE         <> 'NULL'   ) then
                              begin
                               sSqlAux := sSqlAux + ' ,VALORINDICE 	     = ' + sVALORINDICE;
                               sSqlComando:=sSqlComando+ ' VALORINDICE_novo='+sVALORINDICE + ' VALORINDICE_antigo = '+sVALORINDICE_antigo;
                              end;

                              if (sDATARECEBIMENTO         <> 'NULL'   ) then
                              begin
                               sSqlAux := sSqlAux + ' ,DATARECEBIMENTO         = ' + QuotedStr(sDATARECEBIMENTO);
                               sSqlComando:=sSqlComando+' DATARECEBIMENTO_novo='+sDATARECEBIMENTO + 'DATARECEBIMENTO_antigo ='+sDATARECEBIMENTO_antigo;
                              end;

                              if (sFLGENTRADA    <> 'NULL'   ) then
                              begin
                               sSqlAux := sSqlAux + ' ,FLGENTRADA    = ' + sFLGENTRADA;
                               sSqlComando :=sSqlComando + ' FLGENTRADA_novo='+sFLGENTRADA + ' FLGENTRADA_antigo' + sFLGENTRADA_antigo;
                              end;

                              if (sDATAALIMENTACAO  <> 'NULL') then
                              begin
                               sSqlAux := sSqlAux + ' ,DATAALIMENTACAO  = ' + QuotedStr(sDATAALIMENTACAO);
                               sSqlComando:=sSqlComando+ ' DATAALIMENTACAO_novo='+sDATAALIMENTACAO + 'DATAALIMENTACAO_antigo='+sDATAALIMENTACAO_antigo;
                              end;

                              //edilaine - SIG117204 : inicio
                              if (sIDTIPORESERVA  <> 'NULL') then
                              begin
                                sSqlAux := sSqlAux + ' ,IDTIPORESERVA  = ' + QuotedStr(sIDTIPORESERVA);
                                sSqlComando:=sSqlComando+ ' IDTIPORESERVA_novo='+sIDTIPORESERVA + 'IDTIPORESERVA_antigo='+sIDTIPORESERVA_antigo;
                              end;
                              //edilaine - SIG117204 : fim


                             
                              //Ewerton Beltramini - SIG 101465 - 17/08/2021 - inicio...
                              if (sIDPESSOA  <> 'NULL') then
                              begin
                                sSqlAux := sSqlAux + ' ,IDPESSOA  = ' + QuotedStr(sIDPESSOA);
                                sSqlComando := sSqlComando + ' IDPESSOA_novo=' + sIDPESSOA + 'IDPESSOA_antigo=' + sIDPESSOA_antigo;
                              end;

                              if (sIDPARTICIPANTE  <> 'NULL') then
                              begin
                                sSqlAux := sSqlAux + ' ,IDPARTICIPANTE  = ' + QuotedStr(sIDPARTICIPANTE);
                                sSqlComando := sSqlComando + ' IDPARTICIPANTE_novo=' + sIDPARTICIPANTE + 'IDPARTICIPANTE_antigo=' + sIDPARTICIPANTE_antigo;
                              end;

                              if (sMESREFERENCIA  <> 'NULL') then
                              begin
                                sSqlAux := sSqlAux + ' ,MESREFERENCIA  = ' + QuotedStr(sMESREFERENCIA);
                                sSqlComando := sSqlComando + ' MESREFERENCIA_novo=' + sMESREFERENCIA + 'MESREFERENCIA_antigo=' + sMESREFERENCIA_antigo;
                              end;

                              if (sIDCONTRIBUICAO  <> 'NULL') then
                              begin
                                sSqlAux := sSqlAux + ' ,IDCONTRIBUICAO  = ' + QuotedStr(sIDCONTRIBUICAO);
                                sSqlComando := sSqlComando + ' IDCONTRIBUICAO_novo=' + sIDCONTRIBUICAO + 'IDCONTRIBUICAO_antigo=' + sIDCONTRIBUICAO_antigo;
                              end;
                              //Ewerton Beltramini - SIG 101465 - 17/08/2021 - Fim.



                              sSqlAux := sSqlAux + ' where IDHISTRESERVA = ' + sIDHISTRESERVA;
                              wqryUpdate.SQL.Text:= sSqlAux;

                              try
                              wqryUpdate.ExecSql;
                              if wqryUpdate.RowsAffected > 0 then
                               begin

                                 mmoArquivo1.Lines.Add('--> IdHistMov alterado com sucesso : ' + Trim(Excel.Cells.Item[ilinha,1].text));
                                 sSqlComando:='Alt.Hist.Reser.lote: ' + sSqlComando;
                                 wqryUpdate.Close;
                                 iIdLogTotalPREV := LeUltRegistro(nil, 'LOGTOTALPREV');
                                 wqryUpdate.SQL.Text:=
                                                'INSERT INTO LOGTOTALPREV '                                  + #13 +
                                                '( '                                                         + #13 +
                                                'IDLOGTOTALPREV, IDMODULO, DESCOPERACAO, IDPESQUISA1, IDUSUARIO, DATA '   + #13 +
                                                ') '                                                         + #13 +
                                                'VALUES '                                                    + #13 +
                                                '(' + IntToStr(iIdLogTotalPREV)                               + ', ' +
                                                IntToStr(Sistema.IdModulo)                                   + ', ' +
                                                '''' + sSqlComando                                           + ''', ' +
                                                sIDHISTRESERVA                                               +', '+
                                                IntToStr(Sistema.IdUsuario)                                  + ', ' +
                                                ' SYSDATE '                                                  + #13 +
                                                ') ';

                                 wqryUpdate.ExecSql;

                               end
                              else
                                 mmoArquivo1.Lines.Add('--> IdHistMov não localizado: ' + Trim(Excel.Cells.Item[ilinha,1].text));
                              Except //SIG 99710
                                 on E: Exception do
                                   begin
                                    mmoArquivo1.Lines.Add('--> Erro ao alterar o IdHistMov ' + Trim(Excel.Cells.Item[ilinha,1].text) + 'Erro: '+ E.Message );
                                   end;
                              end;
                        end;

                          iLinha := iLinha + 1;

                    end
                    else
                        bSair := False;
            end;
      end

      else if RgrgTipoOperacao1.ItemIndex = 1 then
      begin
           while bSair do
            begin
                    if Excel.Cells.Item[ilinha,1].Text <> '' then
                    begin

                          //Trantando os valores vindos do excel...
                          sIDHISTRESERVA   := Excel.Cells.Item[ilinha,1].Value;
                          if sIDHISTRESERVA    = ''  then  sIDHISTRESERVA   := '0';

                          if (sIDHISTRESERVA <> '0') then
                          begin
                                            
                              qry.Close;
                              qry.sql.Clear;
                              qry.Sql.Add('select idpessoa from histmovreserva where IDHISTRESERVA =  ' + sIDHISTRESERVA);
                              try
                              qry.open;
                                                   Except
                                on E: Exception do
                                        begin
                                        ShowMessage('Erro: ' + E.Message );
                                        Close;
                                        end;
                              end;

                              if qry.recordcount = 1 then
                              begin
                                    sSqlAux := '';
                                    wqryUpdate.Close;
                                    sSqlAux := ' delete from histmovreserva ';
                                    sSqlAux := sSqlAux + ' where IDHISTRESERVA = ' + sIDHISTRESERVA;
                                    wqryUpdate.SQL.Text:= sSqlAux;
                                    wqryUpdate.ExecSql;
                                    mmoArquivo1.Lines.Add('--> IDHISTRESERVA Excluido: ' + Trim(Excel.Cells.Item[ilinha,1].text));
                                    
                                     wqryUpdate.Close;
                                    iIdLogTotalPREV := LeUltRegistro(nil, 'LOGTOTALPREV');
                                    wqryUpdate.SQL.Text:=
                                                'INSERT INTO LOGTOTALPREV '                                  + #13 +
                                                '( '                                                         + #13 +
                                                'IDLOGTOTALPREV, IDMODULO, DESCOPERACAO, IDPESQUISA1, IDUSUARIO, DATA '   + #13 +
                                                ') '                                                         + #13 +
                                                'VALUES '                                                    + #13 +
                                                '(' + IntToStr(iIdLogTotalPREV)                               + ', ' +
                                                IntToStr(Sistema.IdModulo)                                   + ', ' +
                                                '''' + 'Exclusão do Histórico de Reserva em lote.'           + ''', ' +
                                                sIDHISTRESERVA                                               +', '+
                                                IntToStr(Sistema.IdUsuario)                                  + ', ' +
                                                ' SYSDATE '                                                  + #13 +
                                                ') ';

                                 wqryUpdate.ExecSql;
                              end
                              else
                              begin
                                   mmoArquivo1.Lines.Add('--> IDHISTRESERVA não localizado: ' + Trim(Excel.Cells.Item[ilinha,1].text));
                              end;
                          
                          end;
                          iLinha := iLinha + 1;
                    end
                    else
                        bSair := False;
            end;
      end;
      

   //   if RgrgTipoOperacao1.ItemIndex = 0 then
  //      GravaLogTotalPrev('Alteração do Histórico de Reserva em lote')
  //    else if RgrgTipoOperacao1.ItemIndex = 1 then
  //      GravaLogTotalPrev('Exclusão do Histórico de Reserva em lote');

      dtmBaseDados.dbBaseDados.Commit;
      mmoArquivo1.Lines.Add('Processo finalizado! ' + 'Total de linhas Processadas: ' + IntToStr(iLinha-2));
      Excel.Quit;
      Excel := Unassigned;

 Except
  dtmBaseDados.dbBaseDados.Rollback;
  Excel.Quit;
  Excel := Unassigned;
  btn3.Click;
 end;
 end;


procedure TFrmAlteraHistMovReserva.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  edt1.Clear;
  mmoArquivo1.Clear;
end;

procedure TFrmAlteraHistMovReserva.FormShow(Sender: TObject);
begin
  inherited;

      //Ewerton Beltramini - SIG101465 - 13/05/2022 - Inicio..................................................
      QryImpAux.Close;
      QryImpAux.Sql.Clear;
      QryImpAux.Sql.add('SELECT IDUSUARIO, IDGRUPO FROM GRUPOUSU');
      QryImpAux.Sql.add(' WHERE IDGRUPO in (822,1035) ');
      QryImpAux.Sql.add('   AND IDUSUARIO = ' + IntToStr(Sistema.IdUsuario));
      QryImpAux.Open;

      if QryImpAux.FieldByName('IDUSUARIO').AsString <> IntToStr(Sistema.IdUsuario) then
      begin
           MsgDlg('Você não tem permissão para acessar esta tela.', 'Contribuição-Prev', mtWarning, [mbOK], 0);
           Close;
      end;
     //Ewerton Beltramini - SIG101465 - 18/08/2021 - Fim.....................................................  


end;

end.
