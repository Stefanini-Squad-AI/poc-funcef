// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 07.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit FParamRelResumoFunc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, DRelatAdmPrev, Db, DBTables,
  Wwquery;

type
  TfrmParamRelResumoFunc = class(TfrmOkCancelar)
    edParticipante: TEdit;
    edMatricula: TEdit;
    edNumInsc: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edPatrocinadora: TEdit;
    edPlano: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    bbtnProcurar: TBitBtn;
    MontaSelect: TMontaSelect;
    qryPatro: TwwQuery;
    procedure bbtnProcurarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    sFlgInterno,
    sIdPessoa, sIdPessJur : string;
    procedure LimpaCampos;
  public
    { Public declarations }
  end;

var
  frmParamRelResumoFunc: TfrmParamRelResumoFunc;

implementation

uses DRelatorios, UMensErro, UAdmPrev, DRelatAdmPREV2, DAPrev;

{$R *.DFM}

procedure TfrmParamRelResumoFunc.LimpaCampos;
begin
   edParticipante.Text  := '';
   edMatricula.Text     := '';
   edPatrocinadora.Text := '';
   edNumInsc.Text       := '';
   edPlano.Text         := '';
   sIdPessoa            := '-1';
   sIdPessJur           := '-1';
end;

procedure TfrmParamRelResumoFunc.bbtnProcurarClick(Sender: TObject);
begin
  inherited;
  MontaSelect.Executar;

  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '')
  then begin
     sIdPessoa            := MontaSelect.ValoresChave[0];
     sIdPessJur           := MontaSelect.ValoresChave[1];
     edParticipante.Text  := MontaSelect.ValoresChave[3];
     edPatrocinadora.Text := MontaSelect.ValoresChave[4];
     edPlano.Text         := MontaSelect.ValoresChave[5];
     edMatricula.Text     := MontaSelect.ValoresChave[7];
     edNumInsc.Text       := MontaSelect.ValoresChave[8];
     sFlgInterno          := MontaSelect.ValoresChave[9]; 
  end
  else LimpaCampos;
end;

procedure TfrmParamRelResumoFunc.FormShow(Sender: TObject);
var i : integer;
begin
  inherited;
  LimpaCampos;
  MontaSelect.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); 
end;

procedure TfrmParamRelResumoFunc.bbtnConfirmarClick(Sender: TObject);
var i, iLinha, iContItem : word;
    sCodItemAtual,
    sAnoMesAtual,
    sMenorAnoMes,
    sMaiorAnoMes         : string;
    dTotalNoMes          : double;
    varFields            : variant;
    bTrocouDeItem        : boolean;
begin
  if Trim(edParticipante.Text) = ''
  then begin
     MsgDlg('Selecione o Participante. ','Erro',mtError,[mbOk,mbHelp],0);
     Abort;
  end;

  qryPatro.Close;
  qryPatro.ParamByName('IdPessJur').AsInteger := StrToInt(sIdPessJur);
  qryPatro.Open;
  qryPatro.Close;

  with dtmRelatAdmPrev2 do
  begin
     qryFundacao.Close;
     qryFundacao.ParamByName('pFundacao').asinteger;
     qryFundacao.ParamByName('pFundacao').asinteger := iIdFundacao;
     qryFundacao.Prepare;
     qryFundacao.Open;

     qryEvolFunc.Close;
     qryEvolFunc.ParamByName('IdPessoa').AsInteger  := StrToInt(sIdPessoa);
     qryEvolFunc.ParamByName('IdPessJur').AsInteger := StrToInt(sIdPessJur);
     qryEvolFunc.Open;

     qryResumoFunc.Close;
     qryResumoFunc.Open;

     with dtmAPrev.qryAux do
     begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT I.CODITEMPCS, H.MES, H.VALORPROVENTO '+
                ' FROM   ITEMPCS I, HISTRUBSAL H              '+
                ' WHERE  H.IDPESSJUR = '+sIdPessJur+
                ' AND    H.IDPESSOA  = '+sIdPessoa+
                ' AND    H.FLGEQUIPARACAO = 1                 '+
                ' AND    I.TIPO  = H.TIPOITEMPCS              '+
                ' ORDER BY I.ORDEMCALC, I.CODITEMPCS, H.MES ');
        Open;

        // Preencher query com cached updates
        qryHistRubSal.Close;
        qryHistRubSal.Open;

        i         := 1;
        iLinha    := 1;
        iContItem := 1;
        sMenorAnoMes := '9999/99';
        sMaiorAnoMes := '0000/00';
        bTrocouDeItem := True;

        // A query está ordenada por ORDEMCALC, CODITEMPCS, MES
        while not Eof do
        begin
           sCodItemAtual := FieldByName('CODITEMPCS').AsString;
           while (not Eof) and (sCodItemAtual = FieldByName('CODITEMPCS').AsString) do
           begin

              if i = 1
              then begin
                qryHistRubSal.Insert;
                qryHistRubSal.FieldByName('MES').AsString    := FieldByName('MES').AsString;
                qryHistRubSal.FieldByName('LINHA').AsInteger := iLinha;
              end
              else begin
                 qryHistRubSal.Locate('MES', FieldByName('MES').AsString,[loCaseInsensitive]);
                 qryHistRubSal.Edit;
              end;

              if bTrocouDeItem
              then begin
                 case i of
                      1 : qryHistRubSal.FieldByName('TITULO1').AsString := FieldByName('CODITEMPCS').AsString;
                      2 : qryHistRubSal.FieldByName('TITULO2').AsString := FieldByName('CODITEMPCS').AsString;
                      3 : qryHistRubSal.FieldByName('TITULO3').AsString := FieldByName('CODITEMPCS').AsString;
                      4 : qryHistRubSal.FieldByName('TITULO4').AsString := FieldByName('CODITEMPCS').AsString;
                      5 : qryHistRubSal.FieldByName('TITULO5').AsString := FieldByName('CODITEMPCS').AsString;
                 end;
              end;

              case i of
                   1 : qryHistRubSal.FieldByName('COLUNA1').AsFloat := FieldByName('VALORPROVENTO').AsFloat;
                   2 : qryHistRubSal.FieldByName('COLUNA2').AsFloat := FieldByName('VALORPROVENTO').AsFloat;
                   3 : qryHistRubSal.FieldByName('COLUNA3').AsFloat := FieldByName('VALORPROVENTO').AsFloat;
                   4 : qryHistRubSal.FieldByName('COLUNA4').AsFloat := FieldByName('VALORPROVENTO').AsFloat;
                   5 : qryHistRubSal.FieldByName('COLUNA5').AsFloat := FieldByName('VALORPROVENTO').AsFloat;
              end;

              qryHistRubSal.Post;

              if FieldByName('MES').AsString < sMenorAnoMes
              then sMenorAnoMes := FieldByName('MES').AsString;

              if FieldByName('MES').AsString > sMaiorAnoMes
              then sMaiorAnoMes := FieldByName('MES').AsString;

              Next;

              bTrocouDeItem := False;
           end;
           inc(iContItem);
           bTrocouDeItem := True;

           if i < 5
           then inc(i)
           else begin
              i := 1;
              inc(iLinha);
           end;
        end;

        // GRAVAR TOTAIS
        qryHistRubSal.Locate('LINHA', iLinha,[]);
        qryHistRubSal.Edit;
        qryHistRubSal.FieldByName('TITULO5').AsString := 'TOTAIS';
        qryHistRubSal.Post;

        varFields := VarArrayCreate([0,1],varVariant);

        sAnoMesAtual := sMenorAnoMes;
        while sAnoMesAtual <= sMaiorAnoMes do
        begin
           dTotalNoMes := 0;
           First;
           while not Eof do
           begin
              if FieldByName('MES').AsString = sAnoMesAtual
              then dTotalNoMes := dTotalNoMes + FieldByName('VALORPROVENTO').AsFloat;

              Next;
           end;

           if dTotalNoMes > 0
           then begin
              varFields[0] := iLinha;
              varFields[1] := sAnoMesAtual;

              qryHistRubSal.Locate('LINHA;MES', varFields,[loCaseInsensitive]);

              qryHistRubSal.Edit;
              qryHistRubSal.FieldByName('COLUNA5').AsFloat := dTotalNoMes;
              qryHistRubSal.Post;
           end;

           sAnoMesAtual := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual,6,2)),StrToInt(Copy(sAnoMesAtual,1,4)) );
        end;
     end;

     dsHistRubSal.DataSet                    := qryHistRubSal;
     ppHistRubSal.DataSource                 := dsHistRubSal;
     rpResumoFuncQuadro5.Report.DataPipeline := ppHistRubSal;
  end;

  inherited;
end;

end.
