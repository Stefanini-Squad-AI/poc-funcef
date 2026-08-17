unit RVariacaoIndice;

//	-------------------------------------------------------------------------------------------------
//
//    Consulta Variação de Índices
//
//	Autor          :  Telma
//
//	Data de Início	:
//	Data de Término:  03/08/2000
//
//	Modificações	:  14/09/2000  1) Aumentadas larguras das colunas para conter valores acumulados
//                                  maiores (André)
//                     /10/2000  2) Tela totalmente refeita: grid trocado por planilha (Alex)
//                   01/11/2000  3) CloseUp da cbo de índice --> limpa planilha (André)
//

//	-------------------------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, Db, DBTables, Wwquery, Grids,
  Wwdbigrd, Wwdbgrid, wwdblook, Wwdatsrc, TREdit, fcButton, fcImgBtn,
  fcShapeBtn, ppPrvDlg, ppforms, ppCache, ppDB, ppDBBDE, ppComm, ppProd, ppClass, ppReport,
  OleCtrls, vcf1, AxCtrls, wwdbdatetimepicker, CMDateTimePicker, ExtCtrls,
  FSairAjudaImob;

type
  TfrmRelVariacaoIndice = class(TFrmSairAjudaImob)
    Label2: TLabel;
    qryIndice: TwwQuery;
    ds: TwwDataSource;
    qryIndiceMOECODIGO: TFloatField;
    qryIndiceMOEDESC: TStringField;
    qryIndiceMOESIGLA: TStringField;
    qryIndiceMOEPERIODICIDADE: TStringField;
    qryIndiceMOEINATIVO: TStringField;
    qryIndiceFLGPERCVALOR: TStringField;
    qryIndiceDATAINICIO: TDateTimeField;
    qryIndiceDATAFIM: TDateTimeField;
    upd: TUpdateSQL;
    qry: TwwQuery;
    qryANO: TStringField;
    qryMES: TStringField;
    qryCOTDATA: TDateTimeField;
    qryCOTVALOR: TFloatField;
    qryACUMULADO: TFloatField;
    qryDOZEMESES: TFloatField;
    qryMOECODIGO: TFloatField;
    qryCOTMESREF: TStringField;
    qryMOEDESC: TStringField;
    qryMOESIGLA: TStringField;
    Label4: TLabel;
    Label18: TLabel;
    Panel2: TPanel;
    btnSeleciona: TfcShapeBtn;
    edtAcum: TRealEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    edtDataFim: TCMDateTimePicker;
    edtDataIni: TCMDateTimePicker;
    DBcboIndiceCorrecao: TwwDBLookupCombo;
    planilha: TF1Book;
    Label5: TLabel;
    edtTipo: TEdit;
    Label7: TLabel;
    edtPeriod: TEdit;
    qryNUMDIASPRAZO: TFloatField;

    // procedimentos definidos
    procedure DesabilitaBotoes;
    procedure HabilitaBotoes;

    function VerificaPreenchimentoSelecao: boolean;

    // outros procedimentos
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBgrdCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure DBgrdTopRowChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSelecionaClick(Sender: TObject);
    procedure DBcboIndiceCorrecaoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);


  private { Private declarations }
   sAnoIni, sMesIni, sAnoFim, sMesFim        : string;
   sAnoIniDoze, sMesIniDoze                  : string;
//   sAnoFimDoze, sMesFimDoze                  : string;
//   fCotacaoIni, fCotacaoFim, fFatorCorrecao  : double;

  public { Public declarations }

  end;



var frmRelVariacaoIndice: TfrmRelVariacaoIndice;



implementation
{$R *.DFM}
uses
   uModulo, uMensErro, uSistema, uDataBase, Math, uData, uFuncaoGeral, uDiasInUteis,
   uComunsImobiliario, uVerificaPreenchimento, UDiasUteis, uFuncoesImob, FEspera;



procedure TfrmRelVariacaoIndice.DesabilitaBotoes;
begin
   Screen.Cursor        := crHourGlass;

   pnlFundo.Enabled     := False;

   btnSeleciona.Enabled := False;
   bbtnSair.Enabled     := False;
end;



procedure TfrmRelVariacaoIndice.HabilitaBotoes;
begin
   Screen.Cursor        := crDefault;

   pnlFundo.Enabled     := True;

   btnSeleciona.Enabled := True;
   bbtnSair.Enabled     := True;
end;



function TfrmRelVariacaoIndice.VerificaPreenchimentoSelecao: boolean;
begin
   Result := False;

   try

     if DBcboIndiceCorrecao.Text= '' then
        Raise EValidacao.CreateVal('É necessário indicar o Índice!', DBcboIndiceCorrecao);

     if Trim(edtDataIni.Text)= '' then
        Raise EValidacao.CreateVal('É necessário indicar a Data Inicial!', edtDataIni);

     if Trim(edtDataFim.Text)= '' then
        Raise EValidacao.CreateVal('É necessário indicar a Data Final!', edtDataFim);

   except

      On ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;

   Result := True;
end;



procedure TfrmRelVariacaoIndice.FormClose(Sender: TObject; var Action: TCloseAction);
var
   i : integer;
begin
   inherited;

   for i := 0 to (ComponentCount - 1) do begin
      if ( (TObject(Components[i]).ClassType = TwwQuery) and (TwwQuery(Components[i]).Active) ) then begin

         // se houver updates pendentes, devem ser cancelados
         if (
            (TwwQuery(Components[i]).CachedUpdates) and
            (TwwQuery(Components[i]).UpdateObject <> nil) and
            (TwwQuery(Components[i]).Active) and
            (TwwQuery(Components[i]).UpdatesPending)
            ) then
         begin
            TwwQuery(Components[i]).CancelUpdates;
         end;

         TwwQuery(Components[i]).Close;
         TwwQuery(Components[i]).UnPrepare;
      end;
   end;
end;



procedure TfrmRelVariacaoIndice.DBgrdCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;

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



procedure TfrmRelVariacaoIndice.DBgrdTopRowChanged(Sender: TObject);
begin
   inherited;

   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmRelVariacaoIndice.FormShow(Sender: TObject);
begin
   inherited;
   edtDataFim.Date := Date;
   edtAcum.Value   := 0;
   edtPeriod.Text  := '';
   edtTipo.Text    := '';
   qryIndice.Open;
end;



procedure TfrmRelVariacaoIndice.FormCreate(Sender: TObject);
begin
   inherited;
   ppRegisterForm(TppCustomPreviewer, TppPrintPreview);
end;



procedure TfrmRelVariacaoIndice.btnSelecionaClick(Sender: TObject);
const AP = '''';
var
   iAnoFim, iMesFim, iDiaFim  : word;

   dDataFim                   : TDateTime;
   dDataIniDoze, dDataFimDoze : TDateTime;
   fFatorDoze                 : double;
   fAcumulado, fCotacao       : double;

   iIndice     : integer;

   i, iLinha, iPrimeiraLinha: integer;
   sCellAcumulado, sCellIndice, sExpressao: string;
begin
   inherited;

   if VerificaPreenchimentoSelecao then begin

      DesabilitaBotoes;

      iIndice := StrToInt(DBcboIndiceCorrecao.LookupValue);

      try
         Screen.Cursor := crHourGlass;
         btnSeleciona.Enabled := False;

         sAnoIni := IntToStr(DiasInUteis.ExtraiAno(edtDataIni.Date));
         sMesIni := IntToStr(DiasInUteis.ExtraiMes(edtDataIni.Date));
         if length(sMesIni) = 1 then sMesIni := '0' + sMesIni;

         sAnoFim := IntToStr(DiasInUteis.ExtraiAno(edtDataFim.Date));
         sMesFim := IntToStr(DiasInUteis.ExtraiMes(edtDataFim.Date));
         if length(sMesFim) = 1 then sMesFim := '0' + sMesFim;

         frmEspera.Config('Aguarde', 'Calculando acumulado...', False);
         frmEspera.Show;
         Repaint;
         Application.ProcessMessages;

         with qry do begin
            LimpaParametros(qry);
            ParamByName('MOEDA').asInteger     := iIndice;
            ParamByName('DATAINI').asString    := sAnoIni + sMesIni;
            ParamByName('DATAFIM').asString    := sAnoFim + sMesFim;
            Open;

            First;

            // limpa a planilha antes de começar
//            Planilha.ClearRange(1,1,Planilha.MaxRow,Planilha.MaxCol,F1ClearValues);
            Planilha.ClearRange(-1, -1, -1, -1, F1ClearValues);

            Planilha.TableName      := DBcboIndiceCorrecao.Text;
            Planilha.SheetName[1]   := DBcboIndiceCorrecao.Text;
            iLinha := 1;

            {
            // colocar negrito no título
            Planilha.Selection := 'A1:E'+IntToStr(iLinha);
            Planilha.SetFont('Arial',10,true,false,false,false,clBlack,false,false);

            // colocar título colunas centralizados
            Planilha.Selection := 'A'+IntToStr(iLinha)+':E'+IntToStr(iLinha);
            Planilha.SetAlignment(F1HAlignCenter,false,F1VAlignCenter,0);

            Planilha.FixedRows := iLinha;
            Inc(iLinha);
            }

            First;

            //iPrimeiraLinha := iLinha;
            sCellAcumulado := '';

            // Se for percentual colocar a celula F1 como 1
            if qryIndiceFLGPERCVALOR.AsString = 'P' then begin  // indicador percentual
               Planilha.NumberRC[ilinha, 6] := 1;
               Inc(iLinha);
            end;

            while not(EOF) do begin

               Planilha.TextRC[ilinha, 1]    := qryANO.AsString;          // A
               Planilha.TextRC[iLinha, 2]    := qryMES.AsString;          // B
               Planilha.EntryRC[iLinha, 3]   := qryCOTDATA.AsString;      // C
               Planilha.EntryRC[iLinha, 7]   := qryNUMDIASPRAZO.AsString; // G

               { @H Ingeger overflow - calcula o acumulado dooze meses }
               //dDataIniDoze   :=  DiasInUteis.SomaMeses(qryCOTDATA.AsDateTime, -11);
               //dDataFimDoze   := {DiasInUteis.SomaMeses(}qryCOTDATA.AsDateTime{, 0)};
               dDataIniDoze   := IncMonth(qryCOTDATA.AsDateTime, -11);
               dDataFimDoze   := qryCOTDATA.AsDateTime;

               fFatorDoze     := FuncoesImob.CalculaFatorCorrecao(iIndice, dDataIniDoze, dDataFimDoze, True);
               Planilha.NumberRC[ilinha, 5] := (fFatorDoze - 1);

               if qryIndiceFLGPERCVALOR.AsString = 'P' then begin  // indicador percentual

                  Planilha.NumberRC[ilinha, 4] := qryCOTVALOR.AsFloat / 100;     // D

                  // obter a celula a ser usada na fórmula
                  sCellIndice := '$D' + IntToStr(iLinha);

                  // obter a celula do acumulado
                  sCellAcumulado := 'F' + IntToStr(iLinha-1);

                  sExpressao := sCellAcumulado + ' * (1 + ' + sCellIndice + ' )' ;

// Vinicius - 18/03/2005 - Pend.18850 - Fator acumulado sem ser felo valor absoluto.
//                  if qryCOTVALOR.AsFloat > 0 then
//                       sExpressao := sCellAcumulado + ' * (1 + Abs(' + sCellIndice + ') )'
//                  else sExpressao := sCellAcumulado + ' / (1 + Abs(' + sCellIndice + ') )';

                  Planilha.FormulaRC[ilinha, 6] := sExpressao;

               end else begin                                     // indicador valor

                  Planilha.NumberRC[ilinha, 4] := qryCOTVALOR.AsFloat;     // D

                  // primeira passagem
                  if sCellAcumulado = '' then begin
                     Planilha.NumberRC[ilinha, 6] := 1;

                     // obter a celula do acumulado
                     sCellAcumulado := 'F'+IntToStr(iLinha-1);

                  end else begin

                     // obter a celula a ser usada na fórmula
                     sCellIndice := '$D'+IntToStr(iLinha)+'/$D'+IntToStr(iLinha-1);

                     // obter a celula do acumulado
                     sCellAcumulado := 'F'+IntToStr(iLinha-1);

                     sExpressao := sCellAcumulado+'*('+ sCellIndice +')';
                     Planilha.FormulaRC[ilinha, 6] := sExpressao;
                  end;
               end;

               Next;
               Inc(iLinha);
            end;

            fAcumulado := FuncoesImob.CalculaFatorCorrecao(iIndice, edtDataIni.Date, edtDataFim.Date, True);
            fAcumulado := (fAcumulado - 1) * 100;
            edtAcum.Text := formatfloat('#,##0.000000',fAcumulado);

            // alinhar ano, mes e data centralizados
            {
            Planilha.Selection := 'A'+inttostr(iPrimeiraLinha)+':C'+IntToStr(ilinha-1);
            Planilha.SetAlignment(F1HAlignCenter,true,F1VAlignCenter,0);

            Planilha.Selection := 'D2:E'+IntToStr(ilinha-1);
            Planilha.NumberFormat := ('#.##0,000000;[RED](#.##0,000000)');
            }

            // alinhar a coluna D para percentual ou valor
            Planilha.Selection := 'D1:D'+IntToStr(ilinha);
            if qryIndiceFLGPERCVALOR.AsString = 'P' then begin  // indicador percentual
               Planilha.NumberFormat := ('#.##0,000000%;[RED](#.##0,000000%)');
            end else begin
               Planilha.NumberFormat := ('#.##0,000000;[RED](#.##0,000000)');
            end;
            // selecionar a primeira celula da Planilha
            Planilha.Selection := 'A1';
         end;

      finally
         frmEspera.Hide;
         frmEspera.Config('', '', False);
         Repaint;
         Application.ProcessMessages;

         HabilitaBotoes;
         Planilha.SetFocus;
      end;

   end;

end;



procedure TfrmRelVariacaoIndice.DBcboIndiceCorrecaoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   Planilha.ClearRange(-1, -1, -1, -1, F1ClearValues);

   if qryIndiceFLGPERCVALOR.AsString = 'V' then
        edtTipo.Text := 'Valor'
   else edtTipo.Text := 'Percentual';

   case qryIndiceMOEPERIODICIDADE.AsString[1] of
      'D' : edtPeriod.Text := 'Diária';
      'M' : edtPeriod.Text := 'Mensal';
      'A' : edtPeriod.Text := 'Anual';
   end;
end;



end.


{
INPC
--- ----- ----------- ----------
04  1979  01/04/1979        3,45
05  1979  01/05/1979        1,76
06  1979  01/06/1979           3
07  1979  01/07/1979        5,36
08  1979  01/08/1979        5,79
09  1979  01/09/1979        6,61
10  1979  01/10/1979        5,06
11  1979  01/11/1979         6,1
12  1979  01/12/1979        4,51
01  1980  01/01/1980        6,56
02  1980  01/02/1980        4,15
03  1980  01/03/1980        5,12
04  1980  01/04/1980        4,85
05  1980  01/05/1980        5,53
06  1980  01/06/1980        5,52
07  1980  01/07/1980        5,51
08  1980  01/08/1980        5,15
09  1980  01/09/1980        4,45
10  1980  01/10/1980        9,65
11  1980  01/11/1980        8,03
12  1980  01/12/1980         6,8
01  1981  01/01/1981        6,21
02  1981  01/02/1981        6,05
03  1981  01/03/1981        5,35
04  1981  01/04/1981        6,54
05  1981  01/05/1981        5,51
06  1981  01/06/1981        5,07
07  1981  01/07/1981         6,2
08  1981  01/08/1981        6,12
09  1981  01/09/1981        5,28
10  1981  01/10/1981        4,62
11  1981  01/11/1981        5,23
12  1981  01/12/1981        5,69
01  1982  01/01/1982        6,71
02  1982  01/02/1982        6,58
03  1982  01/03/1982        5,24
04  1982  01/04/1982        5,65
05  1982  01/05/1982        6,66
06  1982  01/06/1982        7,14
07  1982  01/07/1982        6,39
08  1982  01/08/1982        5,57
09  1982  01/09/1982         4,3
10  1982  01/10/1982        3,91
11  1982  01/11/1982        5,26
12  1982  01/12/1982        8,19
01  1983  01/01/1983        9,14
02  1983  01/02/1983        8,04
03  1983  01/03/1983        7,22
04  1983  01/04/1983        6,57
05  1983  01/05/1983        6,71
06  1983  01/06/1983       10,83
07  1983  01/07/1983       11,43
08  1983  01/08/1983        9,85
09  1983  01/09/1983       11,27
10  1983  01/10/1983        10,1
11  1983  01/11/1983        7,37
12  1983  01/12/1983        8,34
01  1984  01/01/1984        9,39
02  1984  01/02/1984        9,74
03  1984  01/03/1984        9,83
04  1984  01/04/1984        9,52
05  1984  01/05/1984        8,71
06  1984  01/06/1984        9,96
07  1984  01/07/1984        9,11
08  1984  01/08/1984        8,57
09  1984  01/09/1984        11,1
10  1984  01/10/1984       10,49
11  1984  01/11/1984       10,33
12  1984  01/12/1984       11,62
01  1985  01/01/1985       11,84
02  1985  01/02/1985       10,95
03  1985  01/03/1985        9,94
04  1985  01/04/1985        8,58
05  1985  01/05/1985         7,2
06  1985  01/06/1985        8,33
07  1985  01/07/1985       10,08
08  1985  01/08/1985       11,61
09  1985  01/09/1985       10,09
10  1985  01/10/1985       10,25
11  1985  01/11/1985       14,18
12  1985  01/12/1985       15,75
01  1986  01/01/1986       15,01
02  1986  01/02/1986       12,46
03  1986  01/03/1986        3,18
04  1986  01/04/1986         ,43
05  1986  01/05/1986        1,08
06  1986  01/06/1986         ,97
07  1986  01/07/1986         ,91
08  1986  01/08/1986        1,43
09  1986  01/09/1986        1,19
10  1986  01/10/1986        1,43
11  1986  01/11/1986        3,29
12  1986  01/12/1986        7,27
01  1987  01/01/1987       16,82
02  1987  01/02/1987       13,94
03  1987  01/03/1987        14,4
04  1987  01/04/1987       20,96
05  1987  01/05/1987       23,14
06  1987  01/06/1987        21,3
07  1987  01/07/1987        9,93
08  1987  01/08/1987        5,09
09  1987  01/09/1987        7,15
10  1987  01/10/1987       10,88
11  1987  01/11/1987       14,93
12  1987  01/12/1987       13,97
01  1988  01/01/1988       18,97
02  1988  01/02/1988       15,81
03  1988  01/03/1988       18,09
04  1988  01/04/1988       18,33
05  1988  01/05/1988       18,24
06  1988  01/06/1988       22,28
07  1988  01/07/1988       23,02
08  1988  01/08/1988       20,63
09  1988  01/09/1988       26,93
10  1988  01/10/1988       26,69
11  1988  01/11/1988       28,15
12  1988  01/12/1988       28,43
01  1989  01/01/1989       35,48
02  1989  01/02/1989       16,35
03  1989  01/03/1989         5,9
04  1989  01/04/1989        8,06
05  1989  01/05/1989       16,67
06  1989  01/06/1989        29,4
07  1989  01/07/1989        27,4
08  1989  01/08/1989       33,18
09  1989  01/09/1989       36,35
10  1989  01/10/1989       38,76
11  1989  01/11/1989       48,47
12  1989  01/12/1989       51,28
01  1990  01/01/1990       68,19
02  1990  01/02/1990       73,99
03  1990  01/03/1990       82,18
04  1990  01/04/1990       14,67
05  1990  01/05/1990        7,31
06  1990  01/06/1990       11,64
07  1990  01/07/1990       12,62
08  1990  01/08/1990       12,18
09  1990  01/09/1990       14,26
10  1990  01/10/1990       14,43
11  1990  01/11/1990       16,92
12  1990  01/12/1990       19,14
01  1991  01/01/1991       19,39
02  1991  01/02/1991       20,21
03  1991  01/03/1991           7
04  1991  01/04/1991         8,5
05  1991  01/05/1991        8,93
06  1991  01/06/1991        10,8
07  1991  01/07/1991        12,1
08  1991  01/08/1991        15,6
09  1991  01/09/1991        15,6
10  1991  01/10/1991        21,1
11  1991  01/11/1991        26,5
12  1991  01/12/1991        24,2
01  1992  01/01/1992        25,9
02  1992  01/02/1992        24,5
03  1992  01/03/1992        21,6
04  1992  01/04/1992        20,8
05  1992  01/05/1992        24,5
06  1992  01/06/1992        20,9
07  1992  01/07/1992        22,1
08  1992  01/08/1992        22,4
09  1992  01/09/1992          24
10  1992  01/10/1992        26,1
11  1992  01/11/1992        22,9
12  1992  01/12/1992        25,6
01  1993  01/01/1993        28,8
02  1993  01/02/1993        24,8
03  1993  01/03/1993        27,6
04  1993  01/04/1993        28,4
05  1993  01/05/1993        26,8
06  1993  01/06/1993        30,4
07  1993  01/07/1993          31
08  1993  01/08/1993        33,3
09  1993  01/09/1993        35,6
10  1993  01/10/1993        34,1
11  1993  01/11/1993          36
12  1993  01/12/1993        37,7
01  1994  01/01/1994        41,3
02  1994  01/02/1994        40,6
03  1994  01/03/1994        43,1
04  1994  01/04/1994        42,9
05  1994  01/05/1994        42,7
06  1994  01/06/1994        48,2
07  1994  01/07/1994         7,7
08  1994  01/08/1994         1,9
09  1994  01/09/1994         1,4
10  1994  01/10/1994         2,8
11  1994  01/11/1994           3
12  1994  01/12/1994         1,7
01  1995  01/01/1995         1,4
02  1995  01/02/1995           1
03  1995  01/03/1995         1,6
04  1995  01/04/1995         2,5
05  1995  01/05/1995         2,1
06  1995  01/06/1995        2,18
07  1995  01/07/1995        2,46
08  1995  01/08/1995        1,02
09  1995  01/09/1995        1,17
10  1995  01/10/1995         1,4
11  1995  01/11/1995        1,51
12  1995  01/12/1995        1,65
01  1996  01/01/1996        1,46
02  1996  01/02/1996         ,71
03  1996  01/03/1996         ,29
04  1996  01/04/1996         ,93
05  1996  01/05/1996        1,28
06  1996  01/06/1996        1,33
07  1996  01/07/1996         1,2
08  1996  01/08/1996          ,5
09  1996  01/09/1996         ,02
10  1996  01/10/1996         ,38
11  1996  01/11/1996         ,34
12  1996  01/12/1996         ,33
01  1997  01/01/1997         ,81
02  1997  01/02/1997         ,45
03  1997  01/03/1997         ,68
04  1997  01/04/1997          ,6
05  1997  01/05/1997         ,11
06  1997  01/06/1997         ,35
07  1997  01/07/1997         ,18
08  1997  01/08/1997        -,03
09  1997  01/09/1997          ,1
10  1997  01/10/1997         ,29
11  1997  01/11/1997         ,15
12  1997  01/12/1997         ,57
01  1998  01/01/1998         ,85
02  1998  01/02/1998         ,54
03  1998  01/03/1998         ,49
04  1998  01/04/1998         ,45
05  1998  01/05/1998         ,72
06  1998  01/06/1998         ,15
07  1998  01/07/1998        -,28
08  1998  01/08/1998        -,49
09  1998  01/09/1998        -,31
10  1998  01/10/1998         ,11
11  1998  01/11/1998        -,18
12  1998  01/12/1998         ,42
01  1999  01/01/1999         ,65
02  1999  01/02/1999        1,29
03  1999  01/03/1999        1,28
04  1999  01/04/1999         ,47
05  1999  01/05/1999         ,05
06  1999  01/06/1999         ,07
07  1999  01/07/1999         ,74
08  1999  01/08/1999         ,55
09  1999  01/09/1999         ,39
10  1999  01/10/1999         ,96
11  1999  01/11/1999         ,94
12  1999  01/12/1999         ,74
01  2000  01/01/2000         ,61
02  2000  01/02/2000         ,05
03  2000  01/03/2000         ,13
04  2000  01/04/2000         ,09
05  2000  01/05/2000        -,05
06  2000  01/06/2000          ,3
07  2000  01/07/2000        1,39
}

