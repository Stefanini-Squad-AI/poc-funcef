// Alterações:
{ ------------------------------------------------------------------------------
Pendência   : SIG TIBERO
Responsável : Everson Luiz Pereira da Cunha
Data        : 23/02/2018
Descrição   : Ajustes nos SQL, incluindo os alias nas tabelas/campos.
              Retirada de INDEX, +rule etc.
              Melhoria realizada para adaptação ao TIBERO.
--------------------------------------------------------------------------------
Nº SOL:            192827
Nº KINTANA         1835455
Data da Alteração: 25/02/2014
Alteração Form:    Modificações na rotina de validação do arquivo
Responsável:       William Santana
Descrição:         Criação da funcionalidade Rubricas Individuais Em Lote
--------------------------------------------------------------------------------}


unit fRubricasIndividuaisEmLote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, TB97Ctls, Mask, wwdbdatetimepicker,
  CMDateTimePicker, Db, DBTables, Wwquery, wwdblook, UMensErro, ComObj,
  OleServer, Wwdatsrc, MontaSelect, USistema;

type
  TfrmRubricasIndividuaisEmLote = class(TfrmOkCancelar)
    pgc: TPageControl;
    tabOpcoes: TTabSheet;
    tabResultado: TTabSheet;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    grpRegra: TGroupBox;
    GroupBox4: TGroupBox;
    grpRubrica: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    edtArquivo: TEdit;
    btnAbrirArquivo: TSpeedButton;
    edtReferencia: TMaskEdit;
    bbtnProcessar: TBitBtn;
    edtValor: TEdit;
    btnValidarArquivo: TToolbarButton97;
    bbtnDesfazer: TBitBtn;
    mmoObs: TMemo;
    Label1: TLabel;
    dtDe: TCMDateTimePicker;
    dtAte: TCMDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    spbRecebedor: TSpeedButton;
    SpeedButton1: TSpeedButton;
    qryRegraCalculo: TwwQuery;
    dsRegraCalculo: TDataSource;
    dblcRegra: TwwDBLookupCombo;
    qryRubrica: TwwQuery;
    dsRubrica: TDataSource;
    edtFavorecido: TEdit;
    updRubicaIndiv: TUpdateSQL;
    dsRubricaIndiv: TwwDataSource;
    mmResultado: TMemo;
    qryAux: TwwQuery;
    qryRubricaIndiv: TwwQuery;
    qryRubricaIndivIDPESSOA: TFloatField;
    qryRubricaIndivIDEMPRESA: TFloatField;
    qryRubricaIndivIDRUBRICA: TFloatField;
    qryRubricaIndivNUMOCORRENCIAS: TFloatField;
    qryRubricaIndivSEQRUBRICAINDIV: TFloatField;
    qryRubricaIndivIDFAVORECIDO: TFloatField;
    qryRubricaIndivIDREGRACALCULO: TFloatField;
    qryRubricaIndivVALORRUBRICA: TFloatField;
    qryRubricaIndivANOMESINICIO: TStringField;
    qryRubricaIndivFLGPERMANENTE: TFloatField;
    qryRubricaIndivPARCELAS: TFloatField;
    qryRubricaIndivFLGPERCENT: TFloatField;
    qryRubricaIndivFLGTPRUBMANUT: TStringField;
    qryRubricaIndivFLGPENSAOALIM: TFloatField;
    qryRubricaIndivRUBRICAPROVENTOPA: TFloatField;
    qryRubricaIndivDATAFINAL: TDateTimeField;
    qryRubricaIndivANOMESREF: TStringField;
    qryRubricaIndivTRGDTINCLUSAO: TDateTimeField;
    qryRubricaIndivTRGUSERINCLUSAO: TStringField;
    qryRubricaIndivCODPORTFORMA: TFloatField;
    qryRubricaIndivIDTITULAR: TFloatField;
    qryRubricaIndivDATAINICIO: TDateTimeField;
    qryRubricaIndivFLGBASEPA: TFloatField;
    qryRubricaIndivFLGUSAABONO: TFloatField;
    qryRubricaIndivIDALIMENTADO: TFloatField;
    qryRubricaIndivIDLOTE: TFloatField;
    qryRubricaIndivFLGDESATIVADO: TFloatField;
    qryRubricaIndivFLGUSADO: TFloatField;
    qryRubricaIndivFLGCALCULACPMF: TFloatField;
    qryRubricaIndivULTMESPREPARO: TStringField;
    qryRubricaIndivVALORANTERIOR: TFloatField;
    qryRubricaIndivIDPROCESSO: TFloatField;
    qryRubricaIndivIDRUBRICA13: TFloatField;
    qryRubricaIndivIDRUBRICAPROVENTO13: TFloatField;
    qryRubricaIndivIDMOTIVO: TFloatField;
    qryRubricaIndivIDLOTEREVISAO: TFloatField;
    qryRubricaIndivFLGANTECIPABONO: TFloatField;
    qryRubricaIndivIDSEQINTERNOFB: TFloatField;
    qryRubricaIndivNUMPROCINSS: TStringField;
    qryRubricaIndivIDMOVBENEF: TFloatField;
    qryRubricaIndivFLGCONTROLASALDO: TFloatField;
    qryRubricaIndivVLRSALDOINICIAL: TFloatField;
    qryRubricaIndivVLRTOTALPROC: TFloatField;
    qryRubricaIndivIDPLANOCONTABIL: TFloatField;
    qryRubricaIndivFLGRETROACAO: TFloatField;
    qryRubricaIndivTRGDTALTERACAO: TDateTimeField;
    qryRubricaIndivTRGUSERALTERACAO: TStringField;
    qryRubricaIndivFLGANTECIPAABONOINSS: TFloatField;
    qryRubricaIndivSITUACAOAJ: TStringField;
    qryRubricaIndivOBSERVACAO: TMemoField;
    qryRubricaIndivFLGRUBRICARESGATE: TFloatField;
    qryRubricaIndivMESCOMPREEM: TStringField;
    qryRubricaIndivFLGRESGATEPARCELADO: TFloatField;
    dialog: TOpenDialog;
    MontaSelect: TMontaSelect;
    bbtnSalvar: TBitBtn;
    qryRubricaIDREGRA: TFloatField;
    qryRubricaFLGTPRUBRICA: TStringField;
    qryRegraCalculoIDREGRA: TFloatField;
    qryRegraCalculoNOMEREGRA: TStringField;
    qryRubricaDESCRICAO: TStringField;
    dblcRubrica: TwwDBLookupCombo;
    qryRubricaCODPROVDESC: TStringField;
    qryRubricaIDPROVENTO: TFloatField;
    SaveDlg: TSaveDialog;
    procedure FormShow(Sender: TObject);
    procedure dblcRegraCloseUp(Sender: TObject; LookupTable,FillTable: TDataSet; modified: Boolean);
    procedure btnValidarArquivoClick(Sender: TObject);
    procedure bbtnProcessarClick(Sender: TObject);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
    procedure spbRecebedorClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnDesfazerClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSalvarClick(Sender: TObject);
    procedure pgcChange(Sender: TObject);
    procedure dblcRegraClick(Sender: TObject);
    procedure dblcRubricaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure btnAbrirArquivoClick(Sender: TObject);
    function UltimaLinha(Excel : Variant; var linha: Integer) : Boolean;
    procedure edtReferenciaExit(Sender: TObject);
    procedure setReadOnly(b: boolean);
    function isFloat(texto : String): Boolean;
    function isNumeric(texto : String): Boolean;
    function ValidaAnoMes(anomes : String): Boolean;
  private
    { Private declarations }
    IdFavorecido : Extended;
    NomeArquivo : String;
    mref : string;
    linha :integer;
  public
    { Public declarations }
  end;

var
  frmRubricasIndividuaisEmLote: TfrmRubricasIndividuaisEmLote;

implementation

uses fDesfazerCadastroRubricas, DBaseDados, FTelaAut;

{$R *.DFM}

procedure TfrmRubricasIndividuaisEmLote.FormShow(Sender: TObject);
begin
  pgc.ActivePageIndex := 0;
  dtDe.Date := StrToDate('1/' + FormatDateTime('MM/YYYY',Date));
  qryRegraCalculo.Open;
  qryRubrica.ParamByName('IDREGRA').AsInteger := 0;
  qryRubrica.Open;
 
end;

procedure TfrmRubricasIndividuaisEmLote.dblcRegraCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  if not bbtnProcessar.Enabled then
    begin
      if Trim(dblcRegra.Text) <> '' then
        begin
          dblcRubrica.Clear;
          qryRubrica.Close;
          qryRubrica.ParamByName('IDREGRA').AsInteger := qryRegraCalculo.fieldByName('IDREGRA').AsInteger;
          qryRubrica.Open;
        end;
    end
  else
    begin
      MsgDlg('Os campos da tela não podem ser alterados após a validação do arquivo. Por favor, reinicie o processamento de rubricas individuais em lote.','Atenção',mtInformation,[mbOk],0);
     // dblcRegra.Clear;
    end;
end;

procedure TfrmRubricasIndividuaisEmLote.btnValidarArquivoClick(Sender: TObject);
var
  Excel : Variant;
  countInconsis, TipoRubrica : Integer;
  Parcelas, Matricula, ValorRubrica, IdPlanoContab, MesReembolso, IdRegra, IdPessoa, favorecido, referencia, Rubrica, FontePagadora, RubrAbono : String;
begin
  inherited;
  btnValidarArquivo.Down := False;

  if Trim(edtArquivo.Text) = '' then
    MsgDlg('Arquivo de Entrada não informado.','Atenção',mtInformation,[mbOk],0)
  else if Trim(dtDe.Text) = '' then
    MsgDlg('A data início de processamento é de preenchimento obrigatório para rubricas temporárias.','Atenção',mtInformation,[mbOk],0)
  else
    begin
      Screen.Cursor := crHourGlass;

    {  referencia := Trim(StringReplace(edtReferencia.Text,'/','',[rfReplaceAll]));
      referencia := Trim(StringReplace(referencia,' ','',[rfReplaceAll]));
      if referencia <> '' then
        begin
          if Length(referencia) <> 6 then
            begin
              MsgDlg('O campo ''Referência'' está preenchido de maneira incorreta.','Atenção',mtInformation,[mbOk],0);
              Exit;
            end
          else if (StrToInt(Copy(referencia,1,2)) < 1) or (StrToInt(Copy(referencia,1,2)) > 13)  then
            begin
              MsgDlg('O mês do campo ''Referência'' está incorreto. O mês dever ser entre ''01'' e ''13''.','Atenção',mtInformation,[mbOk],0);
              Exit;
            end;
        end;
     }
      // Cria o objeto
      Excel := CreateOleObject('Excel.application');
      Excel.Visible := False;
      // Abre o Arquivo
      Excel.WorkBooks.Open(dialog.FileName);
      // Indica a partir de qual linha começar a pegar os registros
      linha := 2;

      // Quantidade de inconsistências encontradas
      countInconsis := 0;

      mmResultado.Lines.Clear;
      mmResultado.Lines.Add('Resultado de Validação do Arquivo.');
      mmResultado.Lines.Add('Inconsistências no arquivo ' + ExtractFileName(dialog.FileName));
      mmResultado.Lines.Add(' ');
      if UltimaLinha(Excel, linha) then
        begin
         MsgDlg('O arquivo selecionado não possui informações.','Atenção',mtInformation,[mbOk],0);
         Exit;
        end
      else
       while not UltimaLinha(Excel, linha) do
        begin
          // MATRICULA
          Matricula := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 1].Value));
          if Matricula = '' then
            begin
              mmResultado.Lines.Add('LINHA ' + IntToStr(linha) + ': O campo MATRICULA está vazio.');
              countInconsis := countInconsis + 1;
            end
          else
            begin

              // Validando a MATRICULA
              qryAux.Close;
              qryAux.SQL.Clear;
              qryAux.SQL.Add('SELECT IDPESSOA FROM DEPENTIT WHERE MATRICULA = ' + QuotedStr(Matricula));
              qryAux.Open;

              if qryAux.IsEmpty then
                begin
                  mmResultado.Lines.Add('LINHA ' + IntToStr(linha) + ': A MATRICULA ' + Matricula + ' não existe.');
                  countInconsis := countInconsis + 1;
                  IdPessoa := '';
                end
              else
                IdPessoa := qryAux.FieldByName('IDPESSOA').AsString;
            end;

           //VALOR 
          if (Trim(edtValor.Text) = '') then
          begin
             ValorRubrica := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 2].Value));
             if (ValorRubrica = '') then
             begin
              mmResultado.Lines.Add('LINHA ' + IntToStr(linha) + ': O campo VALOR está vazio.');
              countInconsis := countInconsis + 1;
             end
             else
             if isFloat(ValorRubrica) then
             begin
               if (StrToFloat(ValorRubrica) <= 0) then
               begin
                mmResultado.Lines.Add('LINHA ' + IntToStr(linha) + ': O campo VALOR deve ser maior que zero.');
                countInconsis := countInconsis + 1;
               end;
             end
             else
             begin
                mmResultado.Lines.Add('LINHA ' + IntToStr(linha) + ': O campo VALOR é inválido.');
                countInconsis := countInconsis + 1;  
             end;         
          end ;
         
          // IDREGRA
           if Trim(dblcRegra.Text) <> '' then
              IdRegra := qryRegraCalculoIDREGRA.AsString
           else
              IdRegra := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 3].Value));

          if IdRegra = '' then
            begin
              mmResultado.Lines.Add('LINHA ' + IntToStr(linha) + ': O campo IDREGRA está vazio.');
              countInconsis := countInconsis + 1;
            end
          else if (Trim(dblcRegra.Text) = '') then
            begin

             if isNumeric(IdRegra) then
             begin
              qryAux.Close;
              qryAux.SQL.Clear;
              qryAux.SQL.Add('SELECT R.IDREGRA FROM REGRA R, TIPOREGRA T, GRUPOREGRA G '+
                             ' WHERE R.IDTIPOREGRA = T.IDTIPOREGRA                     '+
                             ' AND T.IDGRUPOREGRA = G.IDGRUPOREGRA                     '+
                             ' AND G.IDGRUPOREGRA = 4                                  '+
                             ' AND T.IDTIPOREGRA = 100                                 '+
                             ' AND R.IDREGRA = ' + IdRegra                              );
              qryAux.Open;

              if qryAux.IsEmpty then
                begin
                  mmResultado.Lines.Add('LINHA ' + IntToStr(linha) + ': O IDREGRA ' + IdRegra + ' não foi encontrada.');
                  countInconsis := countInconsis + 1;
                end;
             end
             else
             begin
               mmResultado.Lines.Add('LINHA ' + IntToStr(linha) + ': O IDREGRA ' + IdRegra + ' não existe.');
               countInconsis := countInconsis + 1;
             end;
            end;

          // SITUAÇÃO
          if Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 6].Value)) = '' then
            begin
              mmResultado.Lines.Add('LINHA ' + IntToStr(linha) + ': O campo SITUAÇÃO está vazio.');
              countInconsis := countInconsis + 1;
            end
          else
           if  not((AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 6].Value))) = 'SIM') or
               (AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 6].Value))) = 'NÃO')) then
            begin
              mmResultado.Lines.Add('LINHA ' + IntToStr(linha) + ': O campo SITUAÇÃO é inválido.');
              countInconsis := countInconsis + 1;
            end;

          // PLANO CONTABIL
          IdPlanoContab := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 7].Value));
          if (IdPlanoContab = '') then
            begin
              mmResultado.Lines.Add('LINHA ' + IntToStr(linha) + ': O campo PLANO CONTABIL está vazio.');
              countInconsis := countInconsis + 1;
            end
          else
            begin
              // Não foi encontrado IDPESSOA a partir da Matricula então  não dá pra validar o PlanoContabil
             if isNumeric(IdPlanoContab) and (Trim(IdPessoa) <> '') then
                begin
                  qryAux.Close;
                  qryAux.SQL.Clear;
                  qryAux.SQL.Add('SELECT B.IDPLANPREVCONTAB  FROM BENEFBFCIARIO B' +
                                 ' WHERE B.IDPESSOA = ' + IdPessoa +
                                 ' AND B.IDPLANPREVCONTAB = ' + IdPlanoContab);
                  qryAux.Open;

                  if qryAux.IsEmpty then
                    begin
                      mmResultado.Lines.Add('LINHA ' + IntToStr(linha) + ': O Assistido não possui benefício no plano contábil informado.');
                      countInconsis := countInconsis + 1;
                    end;
                end
             else
                begin
                    mmResultado.Lines.Add('LINHA ' + IntToStr(linha) + ': O campo PLANO CONTABIL é inválido.');
                    countInconsis := countInconsis + 1;
                end;
            end;

          // PARCELAS
          Parcelas := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 8].Value));
          if (Parcelas = '') then
            begin
              mmResultado.Lines.Add('LINHA ' + IntToStr(linha) + ': O campo PARCELAS está vazio.');
              countInconsis := countInconsis + 1;
            end
          else
          begin
            if isNumeric(Parcelas) then
            begin
               if (StrToFloat(Parcelas) <= 0) then
               begin
                mmResultado.Lines.Add('LINHA ' + IntToStr(linha) + ': O campo PARCELAS deve ser maior que zero.');
                countInconsis := countInconsis + 1;
               end;
            end
            else
            begin
                mmResultado.Lines.Add('LINHA ' + IntToStr(linha) + ': O campo PARCELAS é inválido.');
                countInconsis := countInconsis + 1;
            end;
          end;

          // MÊS REFERÊNCIA
          if (Trim(StringReplace(edtReferencia.Text,'/','',[rfReplaceAll])) = '') and
             (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 9].Value)) = '') then
           begin
             mmResultado.Lines.Add('LINHA ' + IntToStr(linha) + ': O campo MÊS REFERÊNCIA está vazio.');
             countInconsis := countInconsis + 1;
           end
          else
          if (Trim(StringReplace(edtReferencia.Text,'/','',[rfReplaceAll])) = '') then
          begin
           if not(ValidaAnoMes(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 9].Value))) then
           begin
             mmResultado.Lines.Add('LINHA ' + IntToStr(linha) + ': O campo MÊS REFERÊNCIA é inválido.');
             countInconsis := countInconsis + 1;
           end;
          end;

         // MÊS REEMBOLSO
          if (Trim(StringReplace(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 10].Value),'/','',[rfReplaceAll])) <> '') then
          begin
           if not(ValidaAnoMes(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 10].Value))) then
           begin
             mmResultado.Lines.Add('LINHA ' + IntToStr(linha) + ': O campo MÊS REEMBOLSO é inválido.');
             countInconsis := countInconsis + 1;
           end;
          end;

         //Validando IDPESSOA do FAVORECIDO    
          if (edtFavorecido.text = EmptyStr) then
          begin
           favorecido :=  Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 11].Value));
           if (favorecido <> EmptyStr ) then
           begin
            if isNumeric(favorecido) then
            begin
             qryAux.Close;
             qryAux.SQL.Clear;
             qryAux.SQL.Add('SELECT FORNSERV.IDPESSOA                        '+
                           ' FROM PESSOA, FORNSERV, EMPRESAFORN              '+
                           ' WHERE                                           '+
                           ' PESSOA.IDPESSOA = FORNSERV.IDPESSOA AND         '+
                           ' PESSOA.IDPESSOA = EMPRESAFORN.IDFORCLI AND      '+
                           ' EMPRESAFORN.IDPESSOA = 1 AND                    '+
                           ' FORNSERV.IDPESSOA = '+ QuotedStr(favorecido)     );
             qryAux.Open;

             if qryAux.IsEmpty then
             begin
              mmResultado.Lines.Add('LINHA ' + IntToStr(linha) + ': O campo IDPESSOA DO FAVORECIDO está incorreto.');
              countInconsis := countInconsis + 1;
             end;
            end
            else
            begin
             mmResultado.Lines.Add('LINHA ' + IntToStr(linha) + ': O IDPESSOA DO FAVORECIDO ' + favorecido +' não existe.');
             countInconsis := countInconsis + 1;
            end;
           end;
          end;

          // UTILIZADA NO ABONO ANUAL
          if Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 12].Value)) = '' then
            begin
              mmResultado.Lines.Add('LINHA ' + IntToStr(linha) + ' : O campo UTILIZADA NO ABONO ANUAL está vazio.');
              countInconsis := countInconsis + 1;
            end
          else
           if  not((AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 12].Value))) = 'SIM') or
               (AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 12].Value))) = 'NÃO')) then
            begin
              mmResultado.Lines.Add('LINHA ' + IntToStr(linha) + ': O campo UTILIZADA NO ABONO ANUAL é inválido.');
              countInconsis := countInconsis + 1;
            end;

          // UTILIZADA NA ANTECIPAÇÃO DE ABONO INSS
          if Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 13].Value)) = '' then
            begin
              mmResultado.Lines.Add('LINHA ' + IntToStr(linha) + ' : O campo UTILIZADA NA ANTECIPAÇÃO DE ABONO INSS está vazio.');
              countInconsis := countInconsis + 1;
            end
          else
           if  not((AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 13].Value))) = 'SIM') or
               (AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 13].Value))) = 'NÃO')) then
            begin
              mmResultado.Lines.Add('LINHA ' + IntToStr(linha) + ': O campo UTILIZADA NA ANTECIPAÇÃO DE ABONO INSS é inválido.');
              countInconsis := countInconsis + 1;
            end;

          // UTILIZADA NA ANTECIPAÇÃO DE ABONO FUNCEF
          if Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 14].Value)) = '' then
            begin
              mmResultado.Lines.Add('LINHA ' + IntToStr(linha) + ' : O campo UTILIZADA NA ANTECIPAÇÃO DE ABONO FUNCEF está vazio.');
              countInconsis := countInconsis + 1;
            end
          else
           if not((AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 14].Value))) = 'SIM') or
               (AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 14].Value))) = 'NÃO')) then
            begin
              mmResultado.Lines.Add('LINHA ' + IntToStr(linha) + ': O campo UTILIZADA NA ANTECIPAÇÃO DE ABONO FUNCEF é inválido.');
              countInconsis := countInconsis + 1;
            end;

          // RUBRICA DE RESGATE
          if Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 15].Value)) = '' then
            begin
              mmResultado.Lines.Add('LINHA ' + IntToStr(linha) + ': O campo RUBRICA DE RESGATE está vazio.');
              countInconsis := countInconsis + 1;
            end
           else
           if not((AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 15].Value))) = 'SIM') or
               (AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 15].Value))) = 'NÃO')) then
            begin
              mmResultado.Lines.Add('LINHA ' + IntToStr(linha) + ': O campo RUBRICA DE RESGATE é inválido.');
              countInconsis := countInconsis + 1;
            end;

          // RUBRICA A PROCESSAR
          if (Trim(dblcRubrica.Text) = '') and (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 4].Value)) = '') then
            begin
              mmResultado.Lines.Add('LINHA ' + IntToStr(linha) + ': O campo RUBRICA A PROCESSAR está vazio.');
              countInconsis := countInconsis + 1;
            end
          else
          if (IdRegra <> '') then
          begin

            // Pega a Rubrica
            if (Trim(dblcRubrica.Text) <> '' ) then
              Rubrica := qryRubricaCODPROVDESC.AsString
            else
              Rubrica := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 4].Value));

            begin
              // VALIDANDO SE É RUBRICA INSS OU FUNCEF
              MesReembolso := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 10].Value));

              // 1º Verifica se a rubrica do arquivo é FUNCEF ou INSS
              qryAux.Close;
              qryAux.SQL.Clear;
              qryAux.SQL.Add('SELECT 1 FROM PROVDESC P WHERE P.FLGTPRUBRICA LIKE ''%B%'' ' +
                             'AND P.FLGESTADORUB <> 2 AND P.CODPROVDESC = ' + QuotedStr(Rubrica));
              qryAux.Open;

              if qryAux.IsEmpty then

               begin
                  mmResultado.Lines.Add('LINHA ' + IntToStr(linha) + ': A RUBRICA ' + Rubrica + ' não existe.');
                  countInconsis := countInconsis + 1;
               end
              else
              if isNumeric(IdRegra) then
              begin

                qryAux.Close;
                qryAux.SQL.Clear;
                qryAux.SQL.Add('SELECT P.FLGINSS FROM PROVDESC P, REGRAXRUBRICA R WHERE P.IDPROVENTO = R.IDRUBRICA            ');
//                qryAux.SQL.Add(' AND FLGDESCONTO IN (0,1)  AND FLGESTADORUB IN (''0'',''1'') AND FLGTPRUBRICA LIKE ''%B%'' ');    //Everson TIBERO
                qryAux.SQL.Add(' AND P.FLGDESCONTO IN (0,1)  AND P.FLGESTADORUB IN (''0'',''1'') AND P.FLGTPRUBRICA LIKE ''%B%'' ');//Everson TIBERO
                qryAux.SQL.Add(' AND R.IDREGRA =  '    + IdRegra                                                         );
                qryAux.SQL.Add(' AND P.CODPROVDESC = ' + QuotedStr(Rubrica)                                                 );
                qryAux.Open;

                if (qryAux.IsEmpty) then
                begin
                 mmResultado.Lines.Add('LINHA ' + IntToStr(linha) + ' : Não existe associação entre a rubrica e a regra informadas.') ;
                 countInconsis := countInconsis + 1;
                end
                else
                begin
                  // 2º Verifica se a Rubrica é da Funcef e portanto o campo MesReembolso deve estar vazio. Se a Rubrica for do INSS o
                  // campo MesReembolso deve estar preenchido

                  // Pegando o tipo da Rubrica
                  TipoRubrica := qryAux.FieldByName('FLGINSS').AsInteger;
                  if TipoRubrica = 0 then
                    begin
                      if MesReembolso = '' then
                        FontePagadora := ' AND B.FONTEPAGADORA = 1'
                      else
                        begin
                          mmResultado.Lines.Add('LINHA ' + IntToStr(linha) + ': A RUBRICA é da FUNCEF, porém, o campo MESREEMBOLSO não está vazio.');
                          countInconsis := countInconsis + 1;
                        end;
                    end
                  else if TipoRubrica = 1 then
                    begin
                      if MesReembolso <> '' then
                        FontePagadora := ' AND B.FONTEPAGADORA = 2'
                      else
                        begin
                          mmResultado.Lines.Add('LINHA ' + IntToStr(linha) + ': A RUBRICA é do INSS, porém, o campo MESREEMBOLSO não está preenchido.');
                          countInconsis := countInconsis + 1;
                        end;
                    end;

                  // 3º Se o assistido possui benefício do INSS ou FUNCEF cadastrado
                  if Trim(IdPessoa) <> '' then
                    begin
                      qryAux.Close;
                      qryAux.SQL.Clear;
                      qryAux.SQL.Add('SELECT B.IDPESSOA FROM BENEFBFCIARIO B WHERE B.IDPESSOA = ' + IdPessoa + FontePagadora);
                      qryAux.Open;

                      if qryAux.IsEmpty then
                        begin
                          if TipoRubrica = 0 then
                            mmResultado.Lines.Add('LINHA ' + IntToStr(linha) + ': O Assistido não possui benefício da FUNCEF cadastrado.')
                          else
                            mmResultado.Lines.Add('LINHA ' + IntToStr(linha) + ': O Assistido não possui benefício do INSS cadastrado.');
                          countInconsis := countInconsis + 1;
                        end;
                    end;
                end;
              end;
            end;
          end;

          //RUBRICA ABONO
          if (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 5].Value)) <> '') then
            begin
              RubrAbono := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 5].Value));
              qryAux.Close;
              qryAux.SQL.Clear;
              qryAux.SQL.Add('SELECT 1 FROM PROVDESC P WHERE P.FLGTPRUBRICA LIKE ''%B%'' ' +
                             'AND P.FLGESTADORUB <> 2 AND P.CODPROVDESC = ' + QuotedStr(RubrAbono));
              qryAux.Open;

              if  qryAux.IsEmpty then
              begin
                 mmResultado.Lines.Add('LINHA ' + IntToStr(linha) + ': A RUBRICA ABONO ' + RubrAbono + ' não existe.');
                 countInconsis := countInconsis + 1;
              end
              else
              if isNumeric(IdRegra) then
              begin
               qryAux.Close;
               qryAux.SQL.Clear;
               qryAux.SQL.Add('SELECT 1 FROM PROVDESC P, REGRAXRUBRICA R WHERE P.IDPROVENTO = R.IDRUBRICA            ');
//               qryAux.SQL.Add(' AND FLGDESCONTO IN (0,1)  AND FLGESTADORUB IN (''0'',''1'') AND FLGTPRUBRICA LIKE ''%B%'' ');     //Everson TIBERO
               qryAux.SQL.Add(' AND P.FLGDESCONTO IN (0,1)  AND P.FLGESTADORUB IN (''0'',''1'') AND P.FLGTPRUBRICA LIKE ''%B%'' '); //Everson TIBERO
               qryAux.SQL.Add(' AND R.IDREGRA =  '    + IdRegra                                                       );
               qryAux.SQL.Add(' AND P.CODPROVDESC = ' + QuotedStr(RubrAbono)                                                     );
               qryAux.Open;

                if (qryAux.IsEmpty) then
                begin
                 mmResultado.Lines.Add('LINHA ' + IntToStr(linha) + ' : Não existe associação entre a rubrica abono e a regra informadas.') ;
                 countInconsis := countInconsis + 1;
                end
                else
                begin
                  // VALIDANDO SE É RUBRICA ABONO INSS OU FUNCEF
                  MesReembolso := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 10].Value));

                  // 1º Verifica se a rubrica do arquivo é FUNCEF ou INSS
                  qryAux.Close;
                  qryAux.SQL.Clear;
                  qryAux.SQL.Add('SELECT P.FLGINSS FROM PROVDESC P WHERE P.FLGTPRUBRICA LIKE ''%B%'' ' +
                                 'AND P.FLGESTADORUB <> 2 AND P.CODPROVDESC = ' + QuotedStr(RubrAbono));
                  qryAux.Open;

                  if not qryAux.IsEmpty then
                   begin
                      // 2º Verifica se a Rubrica é da Funcef e portanto o campo MesReembolso deve estar vazio. Se a Rubrica for do INSS o
                      // campo MesReembolso deve estar preenchido

                      // Pegando o tipo da Rubrica
                      TipoRubrica := qryAux.FieldByName('FLGINSS').AsInteger;
                      if TipoRubrica = 0 then
                        begin
                          if MesReembolso = '' then
                            FontePagadora := ' AND B.FONTEPAGADORA = 1'
                          else
                            begin
                              mmResultado.Lines.Add('LINHA ' + IntToStr(linha) + ': A RUBRICA ABONO é da FUNCEF, porém, o campo MESREEMBOLSO não está vazio.');
                              countInconsis := countInconsis + 1;
                            end;
                        end
                      else if TipoRubrica = 1 then
                        begin
                          if MesReembolso <> '' then
                            FontePagadora := ' AND B.FONTEPAGADORA = 2'
                          else
                            begin
                              mmResultado.Lines.Add('LINHA ' + IntToStr(linha) + ': A RUBRICA ABONO é do INSS, porém, o campo MESREEMBOLSO não está preenchido.');
                              countInconsis := countInconsis + 1;
                            end;
                        end;

                      // 3º Se o assistido possui benefício do INSS ou FUNCEF cadastrado
                     if Trim(IdPessoa) <> '' then
                      begin
                        qryAux.Close;
                        qryAux.SQL.Clear;
                        qryAux.SQL.Add('SELECT B.IDPESSOA FROM BENEFBFCIARIO B WHERE B.IDPESSOA = ' + IdPessoa + FontePagadora);
                        qryAux.Open;

                        if qryAux.IsEmpty then
                          begin
                            if TipoRubrica = 0 then
                              mmResultado.Lines.Add('LINHA ' + IntToStr(linha) + ': O Assistido não possui benefício da FUNCEF cadastrado.')
                            else
                              mmResultado.Lines.Add('LINHA ' + IntToStr(linha) + ': O Assistido não possui benefício do INSS cadastrado.');
                            countInconsis := countInconsis + 1;
                          end;
                      end;
                   end;
                end;
              end;   
            end;
          // Contador de linha
          linha := linha + 1;
        end;

      // Se tiver 1 ou mais inconsistências encontradas mostra a aba de resultado com as inconsistências
      // e não habilita o botão Processar
      if countInconsis > 0 then
        begin
          bbtnProcessar.Visible := False;
          bbtnDesfazer.Visible  := False;
          bbtnConfirmar.Visible := False;
          bbtnCancelar.Visible  := False;
          bbtnSalvar.Visible    := True;
          bbtnAjuda.Visible     := True;
          pgc.ActivePageIndex := 1;
          setReadOnly(false);
        end
      else
        begin
          bbtnProcessar.Enabled := True;
          bbtnDesfazer.Enabled := False;
          mmResultado.Lines.Clear;
          setReadOnly(true);
        end;

      // Fechando o arquivo
      Excel.Workbooks.Close;
      Excel.Quit;
      Excel := Unassigned;
      Screen.Cursor := crDefault;
    end;
end;

function TfrmRubricasIndividuaisEmLote.UltimaLinha(Excel : Variant; var linha: Integer) : Boolean;
var
  b : boolean;
  cont : integer;
begin
  b := False;
  if (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 1].Value)) = '') and
     (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 2].Value)) = '') and
     (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 3].Value)) = '') and
     (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 4].Value)) = '') and
     (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 5].Value)) = '') and
     (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 6].Value)) = '') and
     (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 7].Value)) = '') and
     (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 8].Value)) = '') and
     (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 9].Value)) = '') and
     (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 10].Value)) = '') and
     (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 11].Value)) = '') and
     (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 12].Value)) = '') then
  b := True;

  if b then
  for cont := 0 to 11 do
  begin
    inc(linha);
    if (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 1].Value)) = '') and
     (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 2].Value)) = '') and
     (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 3].Value)) = '') and
     (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 4].Value)) = '') and
     (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 5].Value)) = '') and
     (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 6].Value)) = '') and
     (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 7].Value)) = '') and
     (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 8].Value)) = '') and
     (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 9].Value)) = '') and
     (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 10].Value)) = '') and
     (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 11].Value)) = '') and
     (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 12].Value)) = '') then
     b := True
    else
    begin
      b := false;
      break;
    end;
  end;

  Result := b;
end;


procedure TfrmRubricasIndividuaisEmLote.bbtnProcessarClick(
  Sender: TObject);
var
  Excel : Variant;
  //linha : integer;
  Parcelas, Matricula, ValorRubrica, IdPlanoContab, Rubrica, RubrAbono : String;
begin
  Screen.Cursor := crHourGlass;

  // Cria o objeto
  Excel := CreateOleObject('Excel.application');
  Excel.Visible := False;
  // Abre o Arquivo
  Excel.WorkBooks.Open(dialog.FileName);
  // Indica a partir de qual linha começar a pegar os registros
  linha := 2;

  // Log de processamento
  mmResultado.Clear;
  mmResultado.Lines.Add('Log de Processamento bem Sucedido. ' + Sistema.NomeUsuario + '.  ' + DateTimeToStr(Now));
  mmResultado.Lines.Add(' ');
  mmResultado.Lines.Add('IDPESSOA;SEQRUBRICAINDIV;RUBRICA A PROCESSAR;RUBRICA ABONO;VALOR RUBRICA;IDREGRA;SITUACAO;PLANO CONTABIL;PARCELAS;' +
                        'MES REFERENCIA;UTILIZADA NO ABONO ANUAL;UTILIZADA NA ANTECIPAÇÃO DE ABONO INSS;' +
                        'UTILIZADA NA ANTECIPAÇÃO DE ABONO FUNCEF;RUBRICA DE RESGATE;IDFAVORECIDO;');

  if not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;

  // qry para gravar
  qryRubricaIndiv.Open;

  while not UltimaLinha(Excel, linha) do
    begin
      qryRubricaIndiv.Insert;

      // MATRICULA
      Matricula := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 1].Value));

      // pegando IDPESSOA a partir da MATRICULA
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT IDPESSOA, IDTITULAR FROM DEPENTIT WHERE MATRICULA = ' + QuotedStr(Matricula));
      qryAux.Open;
      // Granvando IDPESSOA e IDTITULAR
      qryRubricaIndivIDPESSOA.AsInteger := qryAux.FieldByName('IDPESSOA').AsInteger;
      qryRubricaIndivIDTITULAR.AsInteger := qryAux.FieldByName('IDTITULAR').AsInteger;

      // VALOR RUBRICA
      ValorRubrica := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 2].Value));
      // Pegando valor da tela
      if (Trim(edtValor.Text) <> '') and (StrToFloat(edtValor.Text) > 0) then
        qryRubricaIndivVALORRUBRICA.AsFloat := StrToFloat(edtValor.Text)
      // Pegando valor do arquivo
      else if (ValorRubrica <> '') and (StrToFloat(ValorRubrica) > 0) then
        qryRubricaIndivVALORRUBRICA.AsFloat := StrToFloat(ValorRubrica);

     // IDREGRA
     if Trim(dblcRegra.Text) <> '' then
       qryRubricaIndivIDREGRACALCULO.AsInteger := qryRegraCalculoIDREGRA.AsInteger
     else if Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 3].Value)) <> '' then
       qryRubricaIndivIDREGRACALCULO.AsInteger := StrToInt(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 3].Value)));

      // RUBRICA A PROCESSAR
      if (Trim(dblcRubrica.Text) <> '') then
        begin
          // Para mostrar no log deve ser o CODPROVDESC
          Rubrica := qryRubricaCODPROVDESC.AsString;
          // Deve-se gravar o IDPROVENTO
          qryRubricaIndivIDRUBRICA.AsInteger := qryRubricaIDPROVENTO.AsInteger;
        end
      else if (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 4].Value)) <> '') then
        begin
          // Para mostrar no log deve ser o CODPROVDESC
          Rubrica := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 4].Value));
          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.SQL.Add('SELECT P.IDPROVENTO FROM PROVDESC P ' +
                         'WHERE P.FLGTPRUBRICA LIKE ''%B%''   ' +
                         'AND P.FLGESTADORUB <> 2 ' +
                         'AND P.CODPROVDESC = ' + QuotedStr(Rubrica));
          qryAux.Open;
          // Deve-se gravar o IDPROVENTO
          qryRubricaIndivIDRUBRICA.AsInteger := qryAux.FieldByName('IDPROVENTO').AsInteger;
        end;

      // RUBRICA ABONO
      if (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 5].Value)) <> '') then
      begin
        RubrAbono := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 5].Value));
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add('SELECT P.IDPROVENTO FROM PROVDESC P ' +
                        'WHERE P.FLGTPRUBRICA LIKE ''%B%''   ' +
                        'AND P.FLGESTADORUB <> 2 ' +
                        'AND P.CODPROVDESC = ' + QuotedStr(RubrAbono));
         qryAux.Open;
         // Deve-se gravar o IDPROVENTO
        qryRubricaIndivIDRUBRICA13.AsInteger := qryAux.FieldByName('IDPROVENTO').AsInteger;
      end;

      // SITUAÇÃO
      if AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 6].Value))) = 'SIM' then
        qryRubricaIndivFLGPERMANENTE.AsInteger := 1
      else
        qryRubricaIndivFLGPERMANENTE.AsInteger := 0;

      // PLANO CONTABIL
      IdPlanoContab := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 7].Value));
      qryRubricaIndivIDPLANOCONTABIL.AsInteger := StrToInt(IdPlanoContab);

      // PARCELAS
      Parcelas := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 8].Value));
      qryRubricaIndivPARCELAS.AsInteger := StrToInt(Parcelas);

      // MÊS REFERÊNCIA
      if Trim(StringReplace(edtReferencia.Text,'/','',[rfReplaceAll])) <> '' then
        qryRubricaIndivANOMESREF.AsString := mref
      else if (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 9].Value)) <> '') then
        qryRubricaIndivANOMESREF.AsString := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 9].Value));

      //MÊS REEMBOLSO
       if (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 10].Value)) <> '')  then
        qryRubricaIndivMESCOMPREEM.AsString := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 10].Value));

      // UTILIZADA NO ABONO ANUAL
      if AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 12].Value))) = 'SIM' then
        qryRubricaIndivFLGUSAABONO.AsInteger := 1
      else
        qryRubricaIndivFLGUSAABONO.AsInteger := 0;

      // UTILIZADA NA ANTECIPAÇÃO DE ABONO INSS
      if AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 13].Value))) = 'SIM' then
        qryRubricaIndivFLGANTECIPAABONOINSS.AsInteger := 1
      else
        qryRubricaIndivFLGANTECIPAABONOINSS.AsInteger := 0;

      // UTILIZADA NA ANTECIPAÇÃO DE ABONO FUNCEF
      if AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 14].Value))) = 'SIM' then
        qryRubricaIndivFLGANTECIPABONO.AsInteger := 1
      else
        qryRubricaIndivFLGANTECIPABONO.AsInteger := 0;

      // RUBRICA DE RESGATE
      if AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 15].Value))) = 'SIM' then
        qryRubricaIndivFLGRUBRICARESGATE.AsInteger := 1
      else
        qryRubricaIndivFLGRUBRICARESGATE.AsInteger := 0;

      // IDPESSOA DO FAVORECIDO
      if Trim(edtFavorecido.Text) <> '' then
        qryRubricaIndivIDFAVORECIDO.AsFloat := IdFavorecido
      else if Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 11].Value)) <> '' then
        qryRubricaIndivIDFAVORECIDO.AsFloat := StrToFloat(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 11].Value)));

      qryRubricaIndivOBSERVACAO.AsString      := mmoObs.Text;
      qryRubricaIndivNUMOCORRENCIAS.AsInteger := 0;
      qryRubricaIndivIDEMPRESA.AsInteger      := 1;
      qryRubricaIndivFLGTPRUBMANUT.AsString   := '1';
      qryRubricaIndivDATAINICIO.AsDateTime    := dtDe.Date;
      qryRubricaIndivFLGPENSAOALIM.AsInteger  := 0;

      if dtAte.Date <> 0 then
        qryRubricaIndivDATAFINAL.AsDateTime := dtAte.Date;

      // Pegando o SEQRUBRICAINDIV, mas se não tiver o IDPESSOA encontrado pela Matricula, não será possível
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT max(SEQRUBRICAINDIV) AS MAXIMA FROM RUBRICAINDIV '   +
                     'WHERE IDPESSOA = ' + qryRubricaIndivIDPESSOA.AsString + ' ' +
                     'AND   IDEMPRESA = 1 ' +
                     'AND   IDRUBRICA = ' + qryRubricaIndivIDRUBRICA.AsString);
      qryAux.Open;

      // Granvando o SEQRUBRICAINDIV
      if ( not qryAux.IsEmpty) and (qryAux.FieldByName('MAXIMA').AsInteger > 0) then
        qryRubricaIndivSEQRUBRICAINDIV.AsInteger := qryAux.FieldByName('MAXIMA').AsInteger + 1
      else
        qryRubricaIndivSEQRUBRICAINDIV.AsInteger := 1;

      //Controla Saldo = 0
      qryRubricaIndivFLGCONTROLASALDO.AsInteger := 0;

      //Flag Desativado = 0
      qryRubricaIndivFLGDESATIVADO.AsInteger := 0;

      // Log de processamento
      mmResultado.Lines.Add(qryRubricaIndivIDPESSOA.AsString             + ';' +
                            qryRubricaIndivSEQRUBRICAINDIV.AsString      + ';' +
                            Rubrica                                      + ';' +
                            RubrAbono                                    + ';' +
                            qryRubricaIndivVALORRUBRICA.AsString         + ';' +
                            qryRubricaIndivIDREGRACALCULO.AsString       + ';' +
                            qryRubricaIndivFLGPERMANENTE.AsString        + ';' +
                            qryRubricaIndivIDPLANOCONTABIL.AsString      + ';' +
                            qryRubricaIndivPARCELAS.AsString             + ';' +
                            qryRubricaIndivANOMESREF.AsString            + ';' +
                            qryRubricaIndivFLGUSAABONO.AsString          + ';' +
                            qryRubricaIndivFLGANTECIPAABONOINSS.AsString + ';' +
                            qryRubricaIndivFLGANTECIPABONO.AsString      + ';' +
                            qryRubricaIndivFLGRUBRICARESGATE.AsString    + ';' +
                            qryRubricaIndivIDFAVORECIDO.AsString         + ';' +
                            qryRubricaIndivFLGPENSAOALIM.AsString        + ';');


      qryRubricaIndiv.Post;

      qryRubricaIndiv.ApplyUpdates;
      // Contador de linha
      linha := linha + 1;
    end;

  // Fechando o arquivo
  Excel.Workbooks.Close;
  Excel.Quit;
  Excel := Unassigned;
  Screen.Cursor := crDefault;

  mmResultado.Lines.Add('Fim do Log de Processamento bem Sucedido.');

  bbtnProcessar.Enabled := False;
  bbtnDesfazer.Enabled  := False;
  bbtnConfirmar.Enabled := True;
  Screen.Cursor := crDefault;
  setReadOnly(false);
end;

procedure TfrmRubricasIndividuaisEmLote.edtValorKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9',',',#8]) then
    key := #0;
end;

procedure TfrmRubricasIndividuaisEmLote.spbRecebedorClick(Sender: TObject);
begin

  if not bbtnProcessar.Enabled then
    begin
      MontaSelect.Executar;
      if MontaSelect.RetornouValor then
        begin
          edtFavorecido.Text := MontaSelect.ValoresChave[0];
          IdFavorecido := StrToFloat(MontaSelect.ValoresChave[2]);
        end;
    end
  else
    MsgDlg('Os campos da tela não podem ser alterados após a validação do arquivo. Por favor, reinicie o processamento de rubricas individuais em lote.','Atenção',mtInformation,[mbOk],0);
end;

procedure TfrmRubricasIndividuaisEmLote.SpeedButton1Click(Sender: TObject);
begin
  if not bbtnProcessar.Enabled then
    edtFavorecido.Clear
  else
    MsgDlg('Os campos da tela não podem ser alterados após a validação do arquivo. Por favor, reinicie o processamento de rubricas individuais em lote.','Atenção',mtInformation,[mbOk],0);
end;

procedure TfrmRubricasIndividuaisEmLote.bbtnConfirmarClick(Sender: TObject);
var
  Data : String;
begin
  if dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.Commit;

  bbtnProcessar.Visible := False;
  bbtnDesfazer.Enabled  := True;
  bbtnDesfazer.Visible  := False;
  bbtnConfirmar.Enabled := False;
  bbtnConfirmar.Visible := False;
  bbtnCancelar.Visible  := False;
  bbtnSalvar.Visible    := True;
  bbtnAjuda.Visible     := True;
  pgc.ActivePageIndex := 1;

  // Salvando o arquivo de log
  Data := DateTimeToStr(Now);
  Data := StringReplace(Data,'/','',[rfReplaceAll]);
  Data := StringReplace(Data,':','h',[rfReplaceAll]);
  Data := StringReplace(Data,' ','_',[rfReplaceAll]);
  Data := Copy(Data,1,14);

  NomeArquivo := StringReplace(NomeArquivo,'.xlsx','',[rfReplaceAll]);
  NomeArquivo := StringReplace(NomeArquivo,'.xls','',[rfReplaceAll]);
  mmResultado.Lines.SaveToFile('C:\CMSOLUCOES\Executaveis\Bin\' + NomeArquivo + '_' + Sistema.NomeUsuario + '_' + Data + '.txt');
 
end;              

procedure TfrmRubricasIndividuaisEmLote.bbtnDesfazerClick(Sender: TObject);
begin
  inherited;
  edtArquivo.Clear;
  edtReferencia.Clear;
  dblcRegra.Clear;
  dblcRubrica.Clear;
  edtValor.Clear;
  edtFavorecido.Clear;
  dtDe.Clear;
  dtAte.Clear;
  mmoObs.Clear;

  AbrirForm(frmDesfazerCadastroRubricas,TfrmDesfazerCadastroRubricas,False);
end;

procedure TfrmRubricasIndividuaisEmLote.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  qryRubricaIndiv.Close;

  if dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.Rollback;

  edtArquivo.text := '';
  edtFavorecido.text := '';
  edtValor.text := '';
  dblcRegra.Clear;
  dblcRubrica.Clear;
  edtReferencia.Text := '';
  mmoObs.Clear ;
  dtDe.Date := StrToDate('1/' + FormatDateTime('MM/YYYY',Date));
  dtAte.Clear;
  mmResultado.clear;
  setReadOnly(false);
  qryRubrica.Close;
  qryRubrica.ParamByName('IDREGRA').AsInteger := 0;
  qryRubrica.Open;

  bbtnProcessar.Enabled := False;
  bbtnConfirmar.Enabled := False;
end;

procedure TfrmRubricasIndividuaisEmLote.bbtnSalvarClick(Sender: TObject);
begin
  if SaveDlg.Execute then
    mmResultado.Lines.SaveToFile(SaveDlg.FileName);
end;

procedure TfrmRubricasIndividuaisEmLote.pgcChange(Sender: TObject);
begin
  inherited;
  if pgc.ActivePageIndex = 0 then
    begin
      bbtnProcessar.Visible := True;
      bbtnDesfazer.Visible  := True;
      bbtnConfirmar.Visible := True;
      bbtnCancelar.Visible  := True;
      bbtnSalvar.Visible    := False;
      bbtnAjuda.Visible     := False;
    end
  else
   begin
      bbtnProcessar.Visible := False;
      bbtnDesfazer.Visible  := False;
      bbtnConfirmar.Visible := False;
      bbtnCancelar.Visible  := False;
      bbtnSalvar.Visible    := True;
      bbtnAjuda.Visible     := True;
   end;
end;

procedure TfrmRubricasIndividuaisEmLote.dblcRegraClick(Sender: TObject);
begin
  if bbtnProcessar.Enabled then
    MsgDlg('Os campos da tela não podem ser alterados após a validação do arquivo. Por favor, reinicie o processamento de rubricas individuais em lote.','Atenção',mtInformation,[mbOk],0);
end;

procedure TfrmRubricasIndividuaisEmLote.dblcRubricaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  if bbtnProcessar.Enabled then
    begin
      MsgDlg('Os campos da tela não podem ser alterados após a validação do arquivo. Por favor, reinicie o processamento de rubricas individuais em lote.','Atenção',mtInformation,[mbOk],0);
    end;
end;

procedure TfrmRubricasIndividuaisEmLote.btnAbrirArquivoClick(
  Sender: TObject);
begin
  if not bbtnProcessar.Enabled then
    begin
      // Pegando o arquivo
      dialog.Filter := '*.xls|*.xlsx';
      if not dialog.Execute then
        exit
      else
        begin
          edtArquivo.Text:= ExtractFileName(dialog.FileName);
          NomeArquivo := ExtractFileName(dialog.FileName);
        end;
    end
  else
    MsgDlg('Os campos da tela não podem ser alterados após a validação do arquivo. Por favor, reinicie o processamento de rubricas individuais em lote.','Atenção',mtInformation,[mbOk],0);
end;

procedure TfrmRubricasIndividuaisEmLote.edtReferenciaExit(Sender: TObject);
var
  referencia : string;
begin
  inherited;

  referencia := Trim(StringReplace(edtReferencia.Text,'/','',[rfReplaceAll]));
  referencia := Trim(StringReplace(referencia,'_','',[rfReplaceAll]));
  referencia := Trim(StringReplace(referencia,' ','',[rfReplaceAll]));

  if not(Length(referencia) = 0) then
  begin
    if Length(referencia) <> 6 then
     begin
      MsgDlg('O campo ''Referência'' está preenchido de maneira incorreta.','Atenção',mtInformation,[mbOk],0);
      edtReferencia.setFocus;
       Exit;
     end
    else if (StrToInt(Copy(referencia,1,2)) < 1) or (StrToInt(Copy(referencia,1,2)) > 13)  then
    begin
      MsgDlg('O mês do campo ''Referência'' está incorreto. O mês dever ser entre ''01'' e ''13''.','Atenção',mtInformation,[mbOk],0);
      edtReferencia.setFocus;
      Exit;
     end;
  end;

  mref := Copy(referencia,3,6)+'/'+Copy(referencia,1,2);
end;

procedure TfrmRubricasIndividuaisEmLote.setReadOnly(b: boolean);
begin
  edtArquivo.ReadOnly := b;
  edtFavorecido.ReadOnly := b;
  edtValor.ReadOnly := b;
  dblcRegra.ReadOnly := b;
  dblcRubrica.ReadOnly := b;
  edtReferencia.ReadOnly := b;
  mmoObs.ReadOnly := b;
  dtDe.ReadOnly := b;
  dtAte.ReadOnly := b;

end;

function TfrmRubricasIndividuaisEmLote.isFloat(texto : String): Boolean;
var
  x : Double;
  i: integer;
begin
  result := True;
  for i := 1 to length(texto) do
    if not(texto[i] in ['0'..'9',DecimalSeparator]) then
    begin
      result:= false;
      exit;
    end;

  try
   x := StrToFloat(texto) ;   
  except           
   result := False;
  end;
end;

function TfrmRubricasIndividuaisEmLote.isNumeric(texto : String): Boolean;
var
  x : Double;
  i: integer;
begin
  result := True;
  for i := 1 to length(texto) do
    if not(texto[i] in ['0'..'9']) then
    begin
      result:= false;
      exit;
    end;   
  try
   x := StrToInt(texto) ;   
  except           
   result := False;
  end;
end;

function TfrmRubricasIndividuaisEmLote.ValidaAnoMes(anomes : String): Boolean;
begin
  try
    result := true;
    anomes := trim(anomes);
    if Length(anomes) <> 7 then
     begin
      result := false;
      exit;
     end
    else
    if ((Copy(anomes,5,1)) <> '/' ) then
     begin
      result := false;
      exit;
     end;

    if not(isNumeric(Copy(anomes,1,4)) and isNumeric(Copy(anomes,6,2))) then
    begin
      result := false;
      exit;
    end;

    if (StrToInt(Copy(anomes,6,2)) < 1) or (StrToInt(Copy(anomes,6,2)) > 13)  then
    begin
      result := false;
      exit;
    end;

  except
    result := false;
    exit;
  end ;

end;

end.
