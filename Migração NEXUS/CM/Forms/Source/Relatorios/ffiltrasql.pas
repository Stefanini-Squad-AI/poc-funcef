{-------------------------------------------------------------------------------------------------
Rotina......: FormShow
SIG.........: 77119 - TIBERO
Data........: 20/10/2018
Responsável.: Andre Imakawa
Descrição...: Correção Tibero
----------------------------------------------------------------------------------------------------
Rotina......: FazerSelectsGeraisReport
Nº SOL......: 244125.18329
Data........: 06/10/2016
Responsável.: Marcelo Cardoso
Descrição...: Melhoria no Cad. de Relatórios, para que seja validado na primeira consulta, se existe
              dados para o parametro informado. Deve ser apresentado uma menssagem
----------------------------------------------------------------------------------------------------
Rotina......: Grid
Nº SOL......: 231267/16158
Nº KINTANA..: 412192
Data........: 10/10/2014
Responsável.: Higor Nayde
Descrição...: Criação de relacionamento entre consultas
------------------------------------------------------------------------------------------------
Nº SOL......: 177564
Nº KINTANA..: 1627935
Data........: 20/04/2012
Responsável.: Vinicius Ferreira
Descrição...: Quando o parametro comentado na consulta por --... ou /*...*/ não aparecerá na aba parametros
--------------------------------------------------------------------------------------------------
Nº SOL......: 175944/8481
Nº KINTANA..: 1604570
Data........: 15/03/2012
Responsável.: Wylliam Leite da Silva
Descrição...: Foi alterado o campo IntDigts para 20 digitos
--------------------------------------------------------------------------------------------------
Rotina......: FormShow, bbtnConfirmarClick
Nº SOL......: 155728
Nº KINTANA..: 1212675
Data........: 31/03/2011
Responsável.: Thaise Amaral Martins
Descrição...: Fazer quebra de linha na quary adicionada ao sql de origem, pois se entrar um comentário
              do tipo --teste, vai evitar que ele comente os comandos adicionados.
--------------------------------------------------------------------------------------------------
}
{ --------------------------------------------------------------------------------------------------
Rotina......: RetiraParams
Nº SOL......: 153413
Nº KINTANA..: 1156996
Data........: 25/02/2011
Responsável.: Thaise Amaral Martins
Descrição...: Recomeçar a contar a string para que ela considere todos os caracteres que estão entre
              o caractere #
---------------------------------------------------------------------------------------------------}

unit fFiltraSql;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
   TB97Tlbr, TB97, ExtCtrls, Db, DBTables, wwQuery, Mask, uMensErro,
   ComCtrls, TREdit, UDataBase, Grids, DBGrids, wwdbdatetimepicker, CMDateTimePicker,
   fPai, uCmSqlParams, DBClient, Tabs, uCMOracleInt, uCMfileUtils, uSistema;

type
   TFrResult = (FrError, FrFull, FrFiltrado);

type
   TFrmFiltraSql = class(TFrmPai)
      MemTrocaSql: TRichEdit;
      pnlFundo: TPanel;
      Panel1: TPanel;
      Label1: TLabel;
      Label2: TLabel;
      Label3: TLabel;
      Bevel1: TBevel;
      Bevel2: TBevel;
      EdtNum: TRealEdit;
      EdtValoresCondicao: TMaskEdit;
      EdtDate: TCMDateTimePicker;
      BtnInclui: TBitBtn;
      BtnExclui: TBitBtn;
      RgJuncoes: TRadioGroup;
      RgParentesis: TRadioGroup;
      Cmbcampos: TComboBox;
      CmbComparadores: TComboBox;
      CkbCaixa: TCheckBox;
      Panel2: TPanel;
      Dock971: TDock97;
      TB97oKCancelar: TToolbar97;
      ToolbarSep971: TToolbarSep97;
      bbtnConfirmar: TBitBtn;
      bbtnCancelar: TBitBtn;
      CkbPrinter: TCheckBox;
      Bevel3: TBevel;
      CdsVersion: TClientDataSet;
      SQLOrigem: TCMSqlParams;
      CdsOrigem: TClientDataSet;
      pgCondicoes: TPageControl;
      tbsFiltros: TTabSheet;
      tsbParametros: TTabSheet;
      tbsgrafico: TTabSheet;
      Panel3: TPanel;
      LstCondicoes: TListBox;
      Panel4: TPanel;
      BtnUp: TBitBtn;
      BtnDow: TBitBtn;
      pnlParametros: TPanel;
      lstParam: TListBox;
      edParam: TEdit;
      BitBtn1: TBitBtn;
      PnlRodapeGrafico: TPanel;
      MemoRodape: TMemo;
      Panel5: TPanel;
      lstParamvalor: TListBox;
      BitBtn2: TBitBtn;
      Label4: TLabel;
      Label5: TLabel;
      lstTipoParam: TListBox;
      Memo1: TMemo;
    cbxTexto: TComboBox;
    cdsTexto: TClientDataSet;
    qryTexto: TCMSqlParams;

      procedure BtnExcluiClick(Sender: TObject);
      procedure BtnUpClick(Sender: TObject);
      procedure BtnIncluiClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure CmbcamposChange(Sender: TObject);
      procedure bbtnCancelarClick(Sender: TObject);
      procedure bbtnSairClick(Sender: TObject);
      procedure BitBtn1Click(Sender: TObject);
      procedure lstParamClick(Sender: TObject);
      procedure BitBtn2Click(Sender: TObject);
    procedure cbxTextoDropDown(Sender: TObject);
//    procedure TabSetChange(Sender: TObject; NewTab: Integer;
//      var AllowChange: Boolean);


   private  // Private declarations

      bOracle81      : Boolean;
      bMontaTela     : Boolean;
      sCampos        : String;
      sSqlOrigem     : String;
      sSqlOriginal   : String;
      sSqlTrocado    : String;

      function BuscaTipoDado(iIndiceCampo: Integer): String;
      function CorrigeDecimaSeparator(sNum, sTipo: String): String;
      function BuscaCampo : Boolean;
      procedure AchaETroca(MemoBusca               : TRichEdit;
                           TextoBusca              : String;
                           TextoTroca              : String;
                           bAdicionaCasoNaoExista  : Boolean
                          );

      procedure RetiraParams;          


   public   // Public declarations

      sCondicoes     : String;
      bFiltered      : Boolean;
      bOrigemGrafico : Boolean;
      sIdReport      :String;

  end;



implementation
{$R *.DFM}



function TFrmFiltraSql.BuscaTipoDado(iIndiceCampo: Integer): String;
begin
   if iIndiceCampo > -1 then
   begin
      // FDias - substituir os parâmetros
      if not(CdsOrigem.Active) then SQLOrigem.Open;

      case CdsOrigem.Fields[Cmbcampos.ItemIndex].DataType of

         ftString                               : Result := 'S';
         ftBytes, ftSmallint, ftInteger, ftWord : Result := 'I';
         ftFloat, ftCurrency                    : Result := 'N';
         ftBoolean                              : Result := 'B';
         ftDate, ftDateTime                     : Result := 'D';
         ftTime                                 : Result := 'T';
         ftBlob, ftMemo, ftGraphic, ftFmtMemo   : Result := 'BL';

      end;
   end
   else
   begin
      Result := '';
   end;
end;



procedure TFrmFiltraSql.BtnExcluiClick(Sender: TObject);
begin
  inherited;
  if LstCondicoes.ItemIndex > -1 then LstCondicoes.Items.Delete(LstCondicoes.ItemIndex);
end;



procedure TFrmFiltraSql.BtnUpClick(Sender: TObject);
var
   iMax, iMin, iIndiceLista, iProximo: Integer;
   sAnterior: String;
begin
   inherited;

   iMax           := LstCondicoes.Items.Count - 1;
   iMin           := 0;
   iIndiceLista   := LstCondicoes.ItemIndex;

   if (iMax = -1) or (iIndiceLista = -1) then Exit;

   // ----------------------------------------------------------------------------------------------
   if (Sender as TBitBtn).Tag = 1 then
   begin
      iProximo := iIndiceLista - 1;
   end
   else
   begin
      iProximo := iIndiceLista + 1;
   end;
   // ----------------------------------------------------------------------------------------------
   if iProximo < iMin then
   begin
      iProximo := iMax
   end
   else
   begin
      if iProximo > iMax then iProximo := iMin;
   end;
   // ----------------------------------------------------------------------------------------------

   sAnterior                        := LstCondicoes.Items[iIndiceLista];
   LstCondicoes.Items[iIndiceLista] := LstCondicoes.Items[iProximo];
   LstCondicoes.Items[iProximo]     := sAnterior;
   LstCondicoes.SetFocus;
   LstCondicoes.ItemIndex           := iProximo;
end;



procedure TFrmFiltraSql.BtnIncluiClick(Sender: TObject);
var
   sAux, sFrase, sJuncao, sCompara, sValor: String;
begin
   inherited;

   if (Cmbcampos.ItemIndex > -1) and (CmbComparadores.ItemIndex > -1) then
   begin
      // -------------------------------------------------------------------------------------------
      case CmbComparadores.ItemIndex of

         0: sCompara := ' = ';
         1: sCompara := ' <> ';
         2: sCompara := ' < ';
         3: sCompara := ' <= ';
         4: sCompara := ' > ';
         5: sCompara := ' >= ';

         6:
         begin
            if bOracle81 then
               sCompara := ' LIKE '
            else
               sCompara := ' = ';
         end;

         7:
         begin
            if bOracle81 then
               sCompara := ' LIKE '
            else
               sCompara := ' = ';
         end;

         //amf 05.01.2007 23709 - Inicio
         8: sCompara := ' IS NULL ';
         9: sCompara := ' IS NOT NULL ';
         //amf 05.01.2007 23709 - fim

      end;  // case CmbComparadores.ItemIndex
      // -------------------------------------------------------------------------------------------

      case RgJuncoes.ItemIndex of
         0: sJuncao := ' and ';
         1: sJuncao := ' or ';
      end;

      sFrase := '';

      sAux := BuscaTipoDado(Cmbcampos.ItemIndex);

      // -------------------------------------------------------------------------------------------
      if bOracle81 then
      begin
         // ----------------------------------------------------------------------------------------
         case sAux[1] of

            // -------------------------------------------------------------------------------------
            'S', 'B':
            begin
               case CmbComparadores.ItemIndex of

                  6: begin
                          if not cbxTexto.Visible then
                             sValor := EdtValoresCondicao.Text + '%'
                          else
                             sValor := cbxTexto.Text + '%';
                     end;
                  7: begin
                           if not cbxTexto.Visible then
                              sValor := '%' + EdtValoresCondicao.Text + '%'
                           else
                              sValor := '%' + cbxTexto.Text + '%';
                     end;
                 else  // case CmbComparadores.ItemIndex
                    if not cbxTexto.Visible then
                       sValor := EdtValoresCondicao.Text
                    else
                       sValor := cbxTexto.Text;
                 // case CmbComparadores.ItemIndex
               end;
               if CkbCaixa.Checked then
                    sFrase := '(' + CdsOrigem.Fields[Cmbcampos.ItemIndex].FieldName + sCompara + '''' + sValor + ''')'
               else
                    sFrase := '(UPPER(' + CdsOrigem.Fields[Cmbcampos.ItemIndex].FieldName + ')' + sCompara + 'UPPER(''' + sValor + '''))'

            end;
            // -------------------------------------------------------------------------------------
            'N','I'  :  begin
                      if  cbxTexto.Visible then begin
                           sFrase := '(' + CdsOrigem.Fields[Cmbcampos.ItemIndex].FieldName +
                                 sCompara + CorrigeDecimaSeparator( cbxTexto.Text,sAux[1]) + ')';
                      end else begin
                           sFrase := '(' + CdsOrigem.Fields[Cmbcampos.ItemIndex].FieldName +
                                 sCompara + CorrigeDecimaSeparator(EdtNum.Text,sAux[1]) + ')';
                      end;
             end;
            // -------------------------------------------------------------------------------------
            'D'      :begin
                        if not cbxTexto.Visible then begin
                           sFrase := '(' + CdsOrigem.Fields[Cmbcampos.ItemIndex].FieldName +
                                 sCompara + 'TO_DATE(''' + EdtDate.Text  + ''',''DD/MM/YYYY''))';
                        end else begin
                            sFrase := '(' + CdsOrigem.Fields[Cmbcampos.ItemIndex].FieldName +
                                 sCompara + 'TO_DATE(''' + cbxTexto.Text  + ''',''DD/MM/YYYY''))';
                          end;
                        end;


            // -------------------------------------------------------------------------------------
            'T'   :begin
                 if not cbxTexto.Visible then begin
                               sFrase :=     '(' + CdsOrigem.Fields[Cmbcampos.ItemIndex].FieldName +
                                   sCompara + 'TO_DATE(''' + EdtValoresCondicao.Text  + ''',''HH/MI''))'
                 end else begin
                                   sFrase :=  '(' + CdsOrigem.Fields[Cmbcampos.ItemIndex].FieldName +
                                   sCompara + 'TO_DATE(''' + cbxTexto.Text  + ''',''HH/MI''))';
                 end;
            // -------------------------------------------------------------------------------------
               end;  // case sAux[1] of
         // ----------------------------------------------------------------------------------------
         end;
      end
      else  // if bOracle81
      begin
         // ----------------------------------------------------------------------------------------
         case sAux[1] of
            // -------------------------------------------------------------------------------------
            'S', 'B':
            begin
               case CmbComparadores.ItemIndex of
                   6: begin
                          if not cbxTexto.Visible then
                             sValor := EdtValoresCondicao.Text + '*'
                          else
                             sValor := cbxTexto.Text + '*';

                     end;
                  7: begin
                           if not cbxTexto.Visible then
                              sValor := EdtValoresCondicao.Text + '*'
                           else
                              sValor := cbxTexto.Text + '*';
                     end;
               else
                    if not cbxTexto.Visible then
                           sValor := EdtValoresCondicao.Text
                        else
                           sValor := cbxTexto.Text;
               end;

               sFrase := '(' + CdsOrigem.Fields[Cmbcampos.ItemIndex].FieldName +
                         sCompara + '''' + sValor + ''')'
            end;
            // -------------------------------------------------------------------------------------
            'N','I'  : begin
                      if not cbxTexto.Visible then begin
                        sFrase := '(' + CdsOrigem.Fields[Cmbcampos.ItemIndex].FieldName +
                                  sCompara + CorrigeDecimaSeparator(EdtNum.Text,sAux[1]) + ')';
                      end
                       else begin
                        sFrase := '(' + CdsOrigem.Fields[Cmbcampos.ItemIndex].FieldName +
                                  sCompara + CorrigeDecimaSeparator(cbxTexto.Text,sAux[1]) + ')';
                      end;

            end;
            // -------------------------------------------------------------------------------------

            'D'      :begin
                      if not cbxTexto.Visible then begin
                          sFrase := '(' + CdsOrigem.Fields[Cmbcampos.ItemIndex].FieldName +
                                 sCompara + '''' + EdtDate.Text  + ''')';
                      end else begin
                          sFrase := '(' + CdsOrigem.Fields[Cmbcampos.ItemIndex].FieldName +
                                 sCompara + '''' + cbxTexto.Text  + ''')';
                      end;
            end;
            // -------------------------------------------------------------------------------------
            'T' : begin
                     if not cbxTexto.Visible then begin
                           sFrase := '(' + CdsOrigem.Fields[Cmbcampos.ItemIndex].FieldName +
                                 sCompara + '''' + EdtValoresCondicao.Text  + ''')';
                     end else begin
                           sFrase := '(' + CdsOrigem.Fields[Cmbcampos.ItemIndex].FieldName +
                                 sCompara + '''' + cbxTexto.Text  + ''')';
                     end;
                 end;

              // -------------------------------------------------------------------------------------
         end;  // case sAux[1]
         // ----------------------------------------------------------------------------------------
      end;   // if bOracle81
      // -------------------------------------------------------------------------------------------

      if sFrase <> '' then
      begin
         case RgParentesis.ItemIndex of
            1: sFrase := '(' + sFrase;
            2: sFrase := sFrase + ')';
         end;

         if LstCondicoes.Items.Count > 0 then sFrase := sJuncao + sFrase;

         //amf 05.01.2007 23709
         if (cmbComparadores.ItemIndex = 8) or
            (cmbComparadores.ItemIndex = 9) then
            sFrase := Copy(sFrase, 1, (Length(sFrase) - 3)) + ')';

         LstCondicoes.Items.Add(sFrase);

         RgJuncoes.ItemIndex := 0;
         RgParentesis.ItemIndex := 0;
         EdtValoresCondicao.Text := '';
      end;  // if sFrase <> ''
   end;  // if (Cmbcampos.ItemIndex > -1) and (CmbComparadores.ItemIndex > -1)
end;



procedure TFrmFiltraSql.FormShow(Sender: TObject);
var
   X, i, z: Integer;
begin
   inherited;

   // Início - Rodolpho da Silva - P: 5998 - 15/09/2005
   { Augusto 23/06/2003 }
   { Caso origem não seja grafico esconde a TAB }
{   if bOrigemGrafico = True then
   begin
      tbsgrafico.Visible       := True;
      PnlRodapeGrafico.Visible := True;
   end
   else
   begin
      tbsgrafico.Visible       := False;
      PnlRodapeGrafico.Visible := False;
   end;}

   tbsgrafico.TabVisible       := bOrigemGrafico;
   pgCondicoes.ActivePageIndex := 0;
   //  Fim - Rodolpho da Silva - P: 5998 - 15/09/2005



   sSqlOrigem := '';
   for z := 0 to SQLOrigem.sql.count - 1 do
   begin
      sSqlOrigem := sSqlOrigem + SQLOrigem.SQL[z] + ' ';
   end;

   CMDebugToFile(SQLOrigem.Sql.Text, Sistema.TempDir + 'QueryRelatorio.txt');

   RetiraParams;   // FDias - 20.02.2004

   bOracle81 := False;

   try
       //cátia - 23626 - 04/01/07
       //SQLVersion.Open;
       //bOracle81 := (CdsVersion.Fields[0].AsInteger >= 8);
         bOracle81 := true;
       //CdsVersion.Close;
   except
      try
       //cátia - 23626 - 04/01/07
      // bOracle81 := (Copy(IntToStr(TCMOracleInt.GetOCIVersion),1,2) >= '81');
         bOracle81 := true;
      except
         bOracle81 := False;
      end;
   end;

//  sSqlOrigem := SQLOrigem.SQL.GetText;  FDias 20.02.2004

   if bOracle81 then
   begin
      SQLOrigem.Sql.Clear;
      //SQLOrigem.Sql.Add('SELECT * FROM (' + sSqlOrigem + ') WHERE 1=2');
      //Thaise Amaral: SOL 155728 - Se o comentário entra, é necessário colocar uma quebra de linha,
      //pois se na query de origem houver comentário assim: --teste,
      //poderá afetar o comando na próxima linha.

      // Andre Imakawa - TIBERO - Início
      if sIdReport <> '4093' then
        SQLOrigem.Sql.Add('SELECT * FROM (')
      else
        SQLOrigem.Sql.Add('SELECT /'+ '*' +'+ no_pre_run_subquery *' + '/' + '* FROM (');
      // Andre Imakawa - TIBERO - Fim

      SQLOrigem.Sql.Add(sSqlOrigem);
      SQLOrigem.Sql.Add(') WHERE 1=2');


      CMDebugToFile(SQLOrigem.Sql.Text, Sistema.TempDir + 'QueryRelatorio.txt');
   end
   else
   begin
      // Acha e troca com where 1=2
      MemTrocaSql.Lines.Assign(SQLOrigem.Sql);
      AchaeTroca(MemTrocaSql, 'WHERE', 'WHERE 1 = 2 AND', False);
      SQLOrigem.Sql.Assign(MemTrocaSql.Lines);

      CmbComparadores.Items.Delete(7);
   end;

   SQLOrigem.Open;
   CdsOrigem.GetFieldNames(Cmbcampos.Items);
   CdsOrigem.Close;

   sCampos := '';

   for X := 0 to Cmbcampos.Items.Count - 1 do
   begin
      if sCampos = '' then
         sCampos := Cmbcampos.Items[x]
      else
         sCampos := sCampos + ', ' + Cmbcampos.Items[x];
   end;

   bMontaTela := False;
end;



procedure TFrmFiltraSql.bbtnConfirmarClick(Sender: TObject);
var
   X, nPos, iMaxLen : Integer;

begin
   inherited;

   sCondicoes  := '';
   bFiltered   := False;

   SQLOrigem.Sql.Clear;

   for x := 0 to lstTipoParam.Items.count - 1 do
   begin
      iMaxLen  := Length(sSqlOriginal);
      nPos     := pos('#'+lstParam.Items[x]+'#',sSQLOriginal);

      while nPos > 0 do
      begin
         if lstParamvalor.Items[x] <> '' then
         begin
            if lstParamvalor.Items[x] = 'Não definido' then lstParamvalor.Items[x] := 'NULO';

            sSQLOriginal := copy(sSQLOriginal, 1, nPos - 1) +
                            lstParamvalor.Items[x] +
                            copy(sSQLOriginal, nPos + length('#' + lstParam.Items[x] + '#'), iMaxLen);
         end
         else
         begin
            if lstTipoParam.Items[x] = 'S' then
               sSQLOriginal := copy(sSQLOriginal, 1, nPos - 1) +
                               copy(sSQLOriginal, nPos + length('#' + lstParam.Items[x] + '#'), iMaxLen)
            else
               sSQLOriginal := copy(sSQLOriginal, 1, nPos - 1) + '0' +
                               copy(sSQLOriginal, nPos + length('#' + lstParam.Items[x] + '#'), iMaxLen)

         end;

         iMaxLen  := Length(sSqlOriginal);
         nPos     := pos('#' + lstParam.Items[x] + '#', sSQLOriginal);

      end;
   end;  // for x := 0 to lstTipoParam.Items.count - 1   


   sSQLOrigem := sSQLOriginal;

   for X := 0 to LstCondicoes.Items.Count - 1 do sCondicoes := sCondicoes + ' ' + LstCondicoes.Items[X];

   if Trim(sCondicoes) <> '' then
   begin
      if bOracle81 then
      begin
         //Thaise Amaral: SOL 155728 - Se o comentário entra, é necessário colocar uma quebra de linha,
         //pois se na query de origem houver comentário assim: --teste,
         //poderá afetar o comando na próxima linha.
         //SQLOrigem.Sql.Add('SELECT ' + sCampos + ' FROM (' + sSqlOrigem + ') WHERE ' + sCondicoes);
         SQLOrigem.Sql.Add('SELECT ');
         SQLOrigem.Sql.Add(sCampos);
         SQLOrigem.Sql.Add(' FROM (');
         SQLOrigem.Sql.Add(sSqlOrigem);
         SQLOrigem.Sql.Add(') WHERE ');
         SQLOrigem.Sql.Add(sCondicoes);
      end
      else  // if bOracle81
      begin
         SQLOrigem.Sql.Add(sSqlOrigem);
         bFiltered := True;
      end;  // if bOracle81 
   end
   else  // if Trim(sCondicoes) <> ''
   begin
      SQLOrigem.Sql.Add(sSqlOrigem);
   end;  // if Trim(sCondicoes) <> ''
end;



procedure TFrmFiltraSql.FormCreate(Sender: TObject);
begin
   inherited;

   bMontaTela                 := True;
   bOracle81                  := False;
   CmbComparadores.ItemIndex  := 0;
   bOrigemGrafico             := False;
   //sIdReport                  :='';
end;



procedure TFrmFiltraSql.CmbcamposChange(Sender: TObject);
var
  sAux: String;
  bAux:Boolean;
begin
   inherited;
   bAux := false;
   if bMontaTela then Exit;

   sAux := BuscaTipoDado(Cmbcampos.ItemIndex);

   CmbComparadores.Items.Clear;
   CmbComparadores.Items.Add('Igual a');
   CmbComparadores.Items.Add('Diferente de');
   CmbComparadores.Items.Add('Menor Que');
   CmbComparadores.Items.Add('Menor Ou Igual a');
   CmbComparadores.Items.Add('Maior Que');
   CmbComparadores.Items.Add('Maior Ou Igual a');
   //aqui

   if sIdReport <> '' then
        bAux := BuscaCampo;

   if sAux <> '' then
   begin
      EdtNum.Visible             := (((sAux = 'N') or (sAux = 'I')) and (not bAux));
      EdtDate.Visible            := ((sAux = 'D')and (not bAux));
      EdtValoresCondicao.Visible := (((sAux = 'S') or (sAux = 'B') or (sAux = 'BL')) and (not bAux));
      cbxTexto.Visible :=  bAux;
      case sAux[1] of

         'T': EdtValoresCondicao.EditMask := '!90:00;1; ';

         'N':
         begin
            EdtNum.DecDigits     := 2;
            EdtNum.NumberFormat  := fNumber;
         end;

         'I':
         begin
            EdtNum.DecDigits     := 0;
            EdtNum.NumberFormat  := iNumber;
         end;

         'S', 'B':
         begin
            CmbComparadores.Items.Add('Começando Com');

            if bOracle81 then CmbComparadores.Items.Add('Possui o Texto');
         end;

      else  // case sAux[1] of
          EdtValoresCondicao.EditMask := '';
      end;  // case sAux[1] of

   end;  // if sAux <> ''

   //amf 05.01.2007 23709 - início
   CmbComparadores.Items.Add('É Nulo');
   CmbComparadores.Items.Add('Não é Nulo');
   //amf 05.01.2007 23709 - fim

   CmbComparadores.ItemIndex := 0;
end;



function TFrmFiltraSql.CorrigeDecimaSeparator(sNum, sTipo: String): String;
var
   sAuxNum, sMilselparador, sDecSaparador: String;
begin
   if bOracle81 then
   begin
      if sTipo = 'I' then
      begin
         Result := sNum;
      end
      else
      begin
         sAuxNum := Trim(sNum);
         sDecSaparador := Copy(sNum,Length(sNum)-2,1);

         if sDecSaparador = '.' then
            sMilselparador := ','
         else
            sMilselparador := '.';

         while Pos(sMilselparador,sAuxNum) <> 0 do Delete(sAuxNum, Pos(sMilselparador,sAuxNum), 1);

         sAuxNum[Length(Trim(sAuxNum))-2] := '.';

         Result := sAuxNum;
      end;
   end
   else
   begin
      sAuxNum := Trim(sNum);

      while Pos('.',sAuxNum) <> 0 do Delete(sAuxNum, Pos('.',sAuxNum), 1);

      Result := sAuxNum;
   end;
end;

procedure TFrmFiltraSql.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   LstCondicoes.Clear;
end;



procedure TFrmFiltraSql.AchaETroca(MemoBusca               : TRichEdit;
                                   TextoBusca              : String;
                                   TextoTroca              : String;
                                   bAdicionaCasoNaoExista  : Boolean
                                  );
var
   sFrase                  : String;
   TamText, iAchou, ilinha : Integer;
begin
   TamText  := Length(MemoBusca.Text);
   iAchou   := MemoBusca.FindText(TextoBusca, 0, TamText,[stWholeWord]);

   if (iAchou < 0) and (bAdicionaCasoNaoExista) then
   begin
      MemoBusca.Lines.Text := MemoBusca.Lines.Text + ' ' + TextoTroca;
   end
   else
   begin
      while iAchou >= 0 do
      begin
         MemoBusca.SetFocus;
         MemoBusca.SelStart   := iAchou;
         MemoBusca.SelLength  := Length(TextoBusca);
         MemoBusca.SelText    := TextoTroca ;

         iAchou := iAchou+Length(TextoTroca);
         iAchou := MemoBusca.FindText(TextoBusca, iAchou, TamText,[stWholeWord]);
      end;  // while iAchou >= 0
   end;

   ilinha := MemoBusca.Lines.Count - 1;
   sFrase := MemoBusca.lines[iLinha];

   if Copy(sFrase,Length(sFrase) - 2,3) = ' and' then
   begin
      MemoBusca.lines[iLinha] := Copy(sFrase,1, Length(sFrase) - 3);
   end;
end;



procedure TFrmFiltraSql.bbtnSairClick(Sender: TObject);
begin
   Close;
end;



{ Augusto 23/06/2003 
procedure TFrmFiltraSql.TabSetChange(Sender: TObject; NewTab: Integer;
                                     var AllowChange: Boolean);
begin
  inherited;
  if NewTab = 0 then begin
    Panel3.BringtoFront;
  end else if NewTab=1 then begin
    PnlRodapeGrafico.BringToFront;
    MemoRodape.Lines.Clear;
    MemoRodape.Lines.Add(LstCondicoes.Items.Text);
  end else if NewTab=2 then begin   //FDias - 17.02.204 - criação de parâmetros
    PnlParametros.BringToFront;
  end;
end;   }          // Trocado por PageControl



procedure TFrmFiltraSql.RetiraParams;
var
   bNaoExiste                 : Boolean;
   iCont, iMaxlen, i, ii, iii, zz  : Integer;
   sSqlAux, sSql, sSqlOrig : string; // Vinicius Ferreira SOL 177564 KINTANA 1627935
begin
   // FDias - 20.02.2004 - criar parâmetros na query de entrada
   sSqlOriginal   := sSQLOrigem;
   iCont          := 1;
   i              := 1;
   ii             := 1;
   iMaxLen        := Length(sSqlOrigem);
   
   // Vinicius Ferreira SOL 177564 KINTANA 1627935 - Inicio
   sSqlOrig := sSqlOrigem;
   // verifica e apaga comentarios /*........*/
   while (copy(sSqlOrig,1,(pos('/*',sSqlOrig)-1))) <> '' do
   begin
   sSql := '';
   sSqlAux := ' ';
   sSql := sSql + copy(sSqlOrig,1,(pos('/*',sSqlOrig)-1));
   sSqlAux := copy(sSqlOrig,pos('/*',sSqlOrig),length(sSqlOrig));
   sSqlAux := copy(sSqlAux,(pos('*/',sSqlAux)+2),length(sSqlAux));
   sSqlOrig := sSql + sSqlAux;
   inc(i);
   end;

   iCont          := 1;
   i              := 1;
   ii             := 1;
   iMaxLen        := Length(sSqlOrigem);

   //sSqlOrig := sSqlOrigem;
   // verifica e apaga comentarios --........
   while (copy(sSqlOrig,1,(pos('--',sSqlOrig)-1))) <> '' do
   begin
   sSql := '';
   sSqlAux := ' ';
   sSql := sSql + copy(sSqlOrig,1,(pos('--',sSqlOrig)-1));
   sSqlAux := copy(sSqlOrig,pos('--',sSqlOrig),length(sSqlOrig));
   sSqlAux := copy(sSqlAux,(pos(''#$D#$A'',sSqlAux)+2),length(sSqlAux));
   sSqlOrig := sSql + sSqlAux;
   inc(i);
   end;

   sSqlOrigem := sSqlOrig;

   iCont          := 1;
   i              := 1;
   ii             := 1;
   iMaxLen        := Length(sSqlOrigem);
   //Vinicius Ferreira SOL 177564 KINTANA 1627935 - Fim

   while i <= iMaxLen do
   begin
      if pos('#',copy(sSqlOrigem,i,1)) > 0 then
      begin
         for ii:= i+1 to iMaxLen do
         begin
            if copy(sSqlOrigem, ii, 1) = '#' then
            begin
               bNaoExiste := True;

               for zz := 0 to lstParam.Items.Count - 1 do
               begin
                  if lstParam.Items[zz] = copy(sSqlOrigem,i+1, (ii - i - 1) ) then bNaoExiste := False;
               end;  // for zz := 0 to lstParam.Items.Count - 1

               if bNaoExiste then
               begin
                  lstParam.Items.add(copy(sSqlOrigem,i+1, (ii - i - 1) ));
                  lstParamvalor.Items.Add('Não definido');
               end;  // if bNaoExiste

               if copy(sSQlOrigem, i-1, 1) = '''' then
               begin
                  sSqlOrigem := copy(sSqlOrigem,1,i-1) + copy(sSqlOrigem, ii + 1, iMaxLen);
                  if bNaoExiste then lstTipoParam.Items.Add('S');
               end
               else  // if copy(sSQlOrigem, i-1, 1) = ''''
               begin
                  sSqlOrigem := copy(sSqlOrigem,1,i-1) + '0' + copy(sSqlOrigem,ii+1,iMaxLen);
                  if bNaoExiste then lstTipoParam.Items.Add('N');
               end;  // if copy(sSQlOrigem, i-1, 1) = ''''

               //Thaise SOL153413 - Contador iniciando novamente do 0, pois
               //estava sendo apagada as posições da string e recontando de onde parou
               //e gerando um problema, pois ele pulava o caractere # do proximo parâmetro.
               //i := ii;
               i := 0;
               Break;
            end;  // if copy(sSqlOrigem, ii, 1) = '#'
         end;  // for ii:= i+1 to iMaxLen
      end;  // if pos('#',copy(sSqlOrigem,i,1)) > 0

      inc(i);

   end;  // while i <= iMaxLen
end;



procedure TFrmFiltraSql.BitBtn1Click(Sender: TObject);
begin
   lstParamvalor.Items[lstParam.ItemIndex] := edParam.Text;
end;



procedure TFrmFiltraSql.lstParamClick(Sender: TObject);
begin
   lstParamvalor.ItemIndex := lstParam.ItemIndex;
   edParam.SetFocus;
end;



procedure TFrmFiltraSql.BitBtn2Click(Sender: TObject);
begin
   lstParamvalor.Items[lstParam.ItemIndex] := '';
end;



function TFrmFiltraSql.BuscaCampo : Boolean;
var sTamplete : string;
    sNomeCampo: string; //SOL244125.18329 - MARCELO CARDOSO
begin

                        //  'select DT.TEMPLATE from CM.REPORTSLISTADATAVIEW RP,DATAVIEW DT  '+
     qryTexto.SQL.Text:= 'select DT.TEMPLATE, RP.FILTRO from CM.REPORTSLISTADATAVIEW RP,DATAVIEW DT  '+
                         ' WHERE RP.IDREPORTS = '+sIdReport+
                         ' AND RP.NOMECAMPO = '+QuotedStr(Cmbcampos.Text)+
                         ' AND DT.IDDATAVIEW = RP.IDDATAVIEWCONSULTA ';
     qryTexto.Open;


     sNomeCampo:=  cdsTexto.fieldbyName('FILTRO').AsString;
     sTamplete :=  cdsTexto.fieldbyName('TEMPLATE').AsString;
     if sTamplete <> '' then begin
       qryTexto.SQL.Text:=  sTamplete;
       qryTexto.Open;
       cbxTexto.Items.Clear;

       while not cdsTexto.Eof do begin
          if sNomeCampo <> '' then
           cbxTexto.Items.Add(cdsTexto.FieldByName(sNomeCampo).AsString) //SOL244125.18329 - MARCELO CARDOSO
          else
           cbxTexto.Items.Add(cdsTexto.Fields[0].AsString);

           cdsTexto.Next;
       end;
       Result := True;
     end else
      Result := False;
end;

//SOL244125.18329 - MARCELO CARDOSO - INICIO
procedure TFrmFiltraSql.cbxTextoDropDown(Sender: TObject);
var
   iWIDTH, i : integer ;
begin
  inherited;

  iWIDTH := 100;

  for i := 0 to Tcombobox(Sender).items.Count do
  begin
    if iWIDTH < Canvas.TextWidth(Tcombobox(Sender).Items.Strings[i]) then
    iWIDTH := Canvas.TextWidth(Tcombobox(Sender).Items.Strings[i]);
  end;

  Tcombobox(Sender).Perform(CB_SETDROPPEDWIDTH, iWIDTH + 10, 0);

end;
//SOL244125.18329 - MARCELO CARDOSO - FIM

end.

