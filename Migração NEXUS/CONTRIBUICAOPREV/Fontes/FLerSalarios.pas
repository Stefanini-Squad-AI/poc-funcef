// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Renato Visoni
// Pendencia   : SOL 149753 Kintana 1080436
// Alteração   : Quando o usuário selecionava um plano especifico o sistema
// buscava todos os planos, desrespeitando o filtro escolhido.
// -----------------------------------------------------------------------------
// Rotina      : Diversas
// Autor(a)    : Camille
// Data        : 19.01.2004
// Pendencia   : ----
// Alteração   : Alteracao para calcular salário do mantido parcial através
//               de regra, se assim estiver parametrizado e não solicitar digitacao
// -----------------------------------------------------------------------------
unit FLerSalarios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Wwdatsrc, Grids,
  Wwdbigrd, Wwdbgrid, MontaSelect, FPreparaEnvia;

type
  TfrmLerSalarios = class(TfrmOkCancelar)
    wwDBGrid1: TwwDBGrid;
    dsPartSql: TwwDataSource;
    qryPartSalGeral: TwwQuery;
    qryPartSalGeralNOME: TStringField;
    qryPartSalGeralNOME_1: TStringField;
    qryPartSalGeralSALARIO: TFloatField;
    qryAux: TwwQuery;
    bbtnProcurar: TBitBtn;
    lblPlano: TLabel;
    lblPatro: TLabel;
    MontaSelectPart: TMontaSelect;
    updPartSalGeral: TUpdateSQL;
    qryPartSalGeralSALMANTIDO: TFloatField;
    qryPartSalGeralSALPARTICIPACAO: TFloatField;
    qryPartSalGeralIDPESSJUR: TFloatField;
    qryPartSalGeralIDPLANOPREV: TFloatField;
    qryPartSalGeralIDPESSOA: TFloatField;
    qryPartSalGeralSEQPROPOSTA: TFloatField;
    qryPartSalGeralINSCRICAONUMERO: TFloatField;
    qryPartSalGeralMATRICULA: TStringField;
    qryPartSal: TwwQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField3: TStringField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    updPartSal: TUpdateSQL;

    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure qryPartSalGeralCalcFields(DataSet: TDataSet);


  private { Private declarations }

     bFlgUsaRubrica : Boolean;

     function  ExecutaRegraCalcSalario(sIdPessoa, sSalarioParticipacao:string):Double;


  public  { Public declarations }

     sIdPlanoPrev, sIdPessJur : string;

     procedure AssociaSalarios( sStrPatro, sStrPlano : string; bProcura : boolean);


  end;




var
  frmLerSalarios: TfrmLerSalarios;




implementation
{$R *.DFM}
uses 
  UContribuicaoPrev, UParticipante, UMensErro, UAdmPrev, UDataBase,
  UFuncoesUteis, DBaseDados;




procedure TfrmLerSalarios.bbtnConfirmarClick(Sender: TObject);
var iIdPessJur,
    iIdPlanoPrev    : Integer;
    vSalarioMantido : Double;
begin
  inherited;
  if not dtmBaseDados.dbBaseDados.InTransaction
  then dtmBaseDados.dbBaseDados.StartTransaction;

  if sIdPlanoPrev <> '' then
     begin
        try
        except
        end;
        qryPartSal.Close;
        qryPartSal.ParamByName('IdPessJur').AsString   := sIdPessJur;
        qryPartSal.Open;
     end
  else
     begin
        qryPartSalGeral.First;
        while not qryPartSalGeral.Eof do
        begin
           iIdPessJur     := qryPartSalGeral.FieldByName('IDPESSJUR').AsInteger;
           iIdPlanoPrev   := qryPartSalGeral.FieldByName('IDPLANOPREV').AsInteger;
           bFlgUsaRubrica := UsaRubricaSalMantido(qryAux, iIdPessJur, iIdPlanoPrev);

               // Calcula salario de mantido parcial
               vSalarioMantido   := ExecutaRegraCalcSalario(qryPartSalGeral.FieldByName('IDPESSOA').AsString,
                                                            qryPartSalGeral.FieldByName('SALARIO').AsString);
               if vSalarioMantido = 0 then
               begin
                  if MsgDlg('O salário para '+
                          Trim(qryPartSalGeral.FieldByName('NOME').AsString)+' foi calculado com valor ZERO. '+#13+
                          'Deseja continuar ?.','Confirmação',mtInformation,[mbYes, mbNo],0) = mrYes
                  then begin
                     qryPartSalGeral.Next;
                     Continue;
                  end
                  else begin
                     if dtmBaseDados.dbBaseDados.InTransaction
                     then dtmBaseDados.dbBaseDados.Rollback;
                     Abort;
                  end;
               end;

               // Grava salario de participacao e salario de manutencao parcial
               qryPartSalGeral.Edit;
               qryPartSalGeral.FieldByName('IDPESSJUR').AsInteger     := qryPartSalGeral.FieldByName('IDPESSJUR').AsInteger;
               qryPartSalGeral.FieldByName('IDPLANOPREV').AsInteger   := qryPartSalGeral.FieldByName('IDPLANOPREV').AsInteger;
               qryPartSalGeral.FieldByName('IDPESSOA').AsInteger      := qryPartSalGeral.FieldByName('IDPESSOA').AsInteger;
               qryPartSalGeral.FieldByName('SEQPROPOSTA').AsInteger   := qryPartSalGeral.FieldByName('SEQPROPOSTA').AsInteger;
               qryPartSalGeral.FieldByName('SALPARTICIPACAO').AsFloat := qryPartSalGeral.FieldByName('SALARIO').AsFloat;
               qryPartSalGeral.FieldByName('SALMANTIDO').AsFloat      := vSalarioMantido;   
               try
                  qryPartSalGeral.Post;
               except
               end;
               qryPartSalGeral.Next;
        end;

        try
          qryPartSalGeral.ApplyUpdates;
        except
          qryPartSalGeral.CancelUpdates;
        end;
        qryPartSalGeral.Close;
        qryPartSalGeral.Open;
     end;

  if dtmBaseDados.dbBaseDados.InTransaction
  then dtmBaseDados.dbBaseDados.Commit;

end;

procedure TfrmLerSalarios.FormCreate(Sender: TObject);
begin
  inherited;
  if sIdPlanoPrev = '' then
     begin
        qryPartSalGeral.Close;
        qryPartSalGeral.Open;
     end
  else
     begin
        qryPartSal.Close;
        qryPartSal.ParamByName('IdPessJur').AsString   := sIdPessJur;
        qryPartSal.Open;
     end;
end;

procedure TfrmLerSalarios.AssociaSalarios( sStrPatro, sStrPlano : string; bProcura : boolean);
begin
   if sStrPlano = '' then
      begin
         qryPartSalGeral.Close;
         qryPartSalGeral.Open;
      end
   else
      begin
         qryPartSal.Close;
         qryPartSal.ParamByName('IdPessJur').AsString   := sIdPessJur;
         qryPartSal.Open;
      end;

   //Renato Visoni SOL 149753 Kintana 1080436
   qryPartSalGeral.Close;
   qryPartSalGeral.SQL.Clear;
   qryPartSalGeral.SQL.Add(' SELECT  PAR.INSCRICAONUMERO,  EL.MATRICULA, P.NOME, ');
   qryPartSalGeral.SQL.Add('                 PL.NOME,  PAR.SALPARTICIPACAO  AS SALARIO,');
   qryPartSalGeral.SQL.Add('                 PAR.SALMANTIDO,');
   qryPartSalGeral.SQL.Add('                 PAR.SALPARTICIPACAO,  PAR.IDPESSJUR, PAR.IDPLANOPREV,');
   qryPartSalGeral.SQL.Add('                 PAR.IDPESSOA,  PAR.SEQPROPOSTA');
   qryPartSalGeral.SQL.Add(' FROM      PLANPREV PL,  PARTPREVPLAN  PAR, PESSOA  P,');
   qryPartSalGeral.SQL.Add('                 SITPART ST,      ELEGPATRO  EL');
   qryPartSalGeral.SQL.Add(' WHERE   ST.FLGINTERNO   = ''MP''');

   if trim(sStrPatro) <> '' then qryPartSalGeral.SQL.Add('AND    PAR.IDPESSJUR IN ('+sStrPatro+')');
   if Trim(sStrPlano) <> '' then qryPartSalGeral.SQL.Add('AND    PAR.IDPLANOPREV   IN ('+sStrPlano+')');

   qryPartSalGeral.SQL.Add(' AND    PAR.IDSITPART    = ST.IDSITPART');
   qryPartSalGeral.SQL.Add(' AND    PAR.IDPLANOPREV  = PL.IDPLANOPREV');
   qryPartSalGeral.SQL.Add(' AND    PAR.IDPESSOA     = P.IDPESSOA');
   qryPartSalGeral.SQL.Add(' AND    PAR.IDPESSJUR    = EL.IDPESSJUR');
   qryPartSalGeral.SQL.Add(' AND    PAR.IDPESSOA     = EL.IDPESSOA');
   qryPartSalGeral.SQL.Add(' ORDER   BY  P.NOME');
   qryPartSalGeral.Open;
   //Renato Visoni SOL 149753 Kintana 1080436

   bbtnProcurar.Visible := bProcura;
   ShowModal;
end;

procedure TfrmLerSalarios.bbtnProcurarClick(Sender: TObject);
begin
  inherited;
  MontaSelectPart.Executar;
  if (MontaSelectPart.ValoresChave.Count > 0) and
     (MontaSelectPart.ValoresChave[0] <> '')
  then begin
         lblPlano.Caption := MontaSelectPart.ValoresChave[0];
         lblPatro.Caption := MontaSelectPart.ValoresChave[1];

         sIdPessJur       := MontaSelectPart.ValoresChave[2];
         sIdPlanoPrev     := MontaSelectPart.ValoresChave[3];
         qryPartSal.Close;
         qryPartSal.ParamByName('IdPessJur').AsString   := sIdPessJur;
         qryPartSal.Open;
  end;
end;



function TfrmLerSalarios.ExecutaRegraCalcSalario(sIdPessoa, sSalarioParticipacao:string):Double;
var
  rValorBaseCalc,
  rValorSalManut,
  rValorRubPerdida,
  rValorRubMantida : Double;
  sUltDiaMes,
  sNovoSalario,
  sNovoSalarioAtivoMP,
  sMsgErro  : string;
begin
  // Calcular Salario pelo Programa, atraves da tabela de rubricas 
  Result := 0;
  if bFlgUsaRubrica
  then begin
        qryAux.Close;
        qryAux.Sql.Clear;
        qryAux.SQL.Add(' SELECT RB.IDPESSOA, RB.IDRUBRICA, RB.VALORRUBRICA, RB.FLGTPRUBMANUT, RB.FLGPERCENT, '+
                   OraNumero(sSalarioParticipacao)+' AS VALORPROVENTO, P.NOME '+
                   ' FROM   RUBRICAINDIV RB, PESSOA P '+
                   ' WHERE  RB.IDPESSOA = '+sIdPessoa  +
                   ' AND    RB.IDPESSOA = P.IDPESSOA   '+
                   ' ORDER  BY FLGTPRUBMANUT ');
        qryAux.Open;
        if qryAux.IsEmpty then Exit;

        rValorBaseCalc   := 0;
        rValorSalManut   := 0;
        rValorRubPerdida := 0;
        rValorRubMantida := 0;

        while not qryAux.Eof do
        begin
           if qryAux.FieldByName('FLGTPRUBMANUT').AsString = 'M' then
              rValorRubMantida := rValorRubMantida + (qryAux.FieldByName('VALORRUBRICA').AsFloat/100)
           else
              if qryAux.FieldByName('FLGTPRUBMANUT').AsString = 'P' then
                 rValorRubPerdida := rValorRubPerdida + (qryAux.FieldByName('VALORRUBRICA').AsFloat/100);
           qryAux.Next;
        end;

        rValorBaseCalc := (StrToFloat(sSalarioParticipacao) / (rValorRubMantida + 1));
        rValorSalManut := (rValorBaseCalc * rValorRubPerdida) + StrToFloat(sSalarioParticipacao);

        rValorSalManut := StrToFloat(FormatFloat('#0.00',rValorSalManut));
        result         := rValorSalManut;
  end
  else begin
     sUltDiaMes := IntToStr(TrazUltDiaMes( StrToInt(Copy(frmPreparaEnvia.sAnoMesCobrancaTela,6,2)), StrToInt(Copy(frmPreparaEnvia.sAnoMesCobrancaTela,1,4))));
     if not GeraSalarioRetroativo( qryPartSalGeral.FieldByName('IDPESSJUR').AsInteger,
                               qryPartSalGeral.FieldByName('IDPLANOPREV').AsInteger,
                               qryPartSalGeral.FieldByName('IdPessoa').AsInteger,
                               'MP',
                               '01/'+Copy(frmPreparaEnvia.sAnoMesCobrancaTela,6,2)+'/'+Copy(frmPreparaEnvia.sAnoMesCobrancaTela,1,4),
                               sUltDiaMes+'/'+Copy(frmPreparaEnvia.sAnoMesCobrancaTela,6,2)+'/'+Copy(frmPreparaEnvia.sAnoMesCobrancaTela,1,4),
                               qryPartSalGeral.FieldByName('SALMANTIDO').AsString,
                               sNovoSalario,
                               sNovoSalarioAtivoMP,
                               qryAux,
                               sMsgErro,
                               'DM',
                               False)
      then Exit;
      Result := StrToFloat(ClienteNumero(sNovoSalario));
  end;
end;

procedure TfrmLerSalarios.qryPartSalGeralCalcFields(DataSet: TDataSet);
begin
  inherited;
  qryPartSalGeral.FieldByName('SALARIO').AsFloat :=
                  qryPartSalGeral.FieldByName('SALPARTICIPACAO').AsFloat;
end;



end.
