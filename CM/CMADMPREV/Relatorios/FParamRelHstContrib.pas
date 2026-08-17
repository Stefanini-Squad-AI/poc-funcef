// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 30.09.2004
// Pendência   : 17822
// Alteração   : Permitir filtrar por mes
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 07.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO 
//------------------------------------------------------------------------------
unit FParamRelHstContrib;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, DRelatAdmPrev, Db, DBTables,
  Wwquery, Spin;

type
  TfrmParamRelHstContrib = class(TfrmOkCancelar)
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
    grpMesAnoRef: TGroupBox;
    Label2: TLabel;
    cmbMesRef: TComboBox;
    spedAnoRef: TSpinEdit;
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
  frmParamRelHstContrib: TfrmParamRelHstContrib;

implementation

uses DRelatorios, UMensErro, UAdmPrev;

{$R *.DFM}

procedure TfrmParamRelHstContrib.LimpaCampos;
begin
   edParticipante.Text  := '';
   edMatricula.Text     := '';
   edPatrocinadora.Text := '';
   edNumInsc.Text       := '';
   edPlano.Text         := '';
   sIdPessoa            := '-1';
   sIdPessJur           := '-1';
end;

procedure TfrmParamRelHstContrib.bbtnProcurarClick(Sender: TObject);
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

procedure TfrmParamRelHstContrib.FormShow(Sender: TObject);
begin
  inherited;
  cmbMesRef.Text  := '';
  spedAnoRef.Text := '';

  LimpaCampos;
  MontaSelect.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); 
end;

procedure TfrmParamRelHstContrib.bbtnConfirmarClick(Sender: TObject);
var sOper, sEnd, sSQL,
    sIdRubrica : string;
    sAnoMesReferencia : string; 
    sAno              : string; 
    sMes              : string; 
begin
  if Trim(edParticipante.Text) = ''
  then begin
     MsgDlg('Selecione o Participante.','Erro',mtError,[mbOk,mbHelp],0);
     Abort;
  end;

  if (Trim(spedAnoRef.Text) <> '') and (Trim(cmbMesRef.Text) <> '')
  then begin
     sAno := Trim(spedAnoRef.Text);
     if cmbMesRef.ItemIndex <= 8
     then sMes := '0'+IntToStr(cmbMesRef.ItemIndex+1)
     else sMes := IntToStr(cmbMesRef.ItemIndex+1);
     sAnoMesReferencia   := sAno+'/'+sMes;
  end
  else sAnoMesReferencia := '';

  qryPatro.Close;
  qryPatro.ParamByName('IdPessJur').AsInteger := StrToInt(sIdPessJur);
  qryPatro.Open;
  if sFlgInterno = 'MA'
  then sIdRubrica := qryPatro.FieldByName('IdRubSalManut').AsString
  else if sFlgInterno = 'MP'
       then sIdRubrica := qryPatro.FieldByName('IdRubSalManutParc').AsString
       else sIdRubrica := qryPatro.FieldByName('IdRubSalParticip').AsString;
  if Trim(sIdRubrica) = '' then sIdRubrica := '0';
  qryPatro.Close;

  with dtmRelatAdmPrev do
  begin
     qryFundacao.Close;
     qryFundacao.ParamByName('pFundacao').asinteger;
     qryFundacao.ParamByName('pFundacao').asinteger := iIdFundacao;
     qryFundacao.Prepare;
     qryFundacao.Open;

     with qryHstcontrib do
     begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT PP.IDPESSJUR, PP.IDPLANOPREV, PP.IDPESSOA, PP.SEQPROPOSTA,                     '+
                '       P.NOME AS NOMEPARTICIP, C.NOME AS NOMECONTRIB, PAT.NOME AS NOMEPATRO,           '+
                '       PL.NOME AS NOMEPLANO,                                                           '+
                '       HST.MESREFERENCIA,      HST.MESCOBRANCA,       HST.VALORESPERADO,               '+
                '       HST.VALORRECEBIDO,      HST.FLGCALCRESERVA,                                     '+
                '       DECODE(HST.FLGDIVERGENTE,0,''Não'',''Sim''),                                    '+
                '       DECODE(HST.FLGDEVOLUCAO,0,''Não'',''Sim''),                                     '+
                '       EL.MATRICULA,           EL.DATAADMISSAO,       PP.INSCRICAONUMERO,              '+
                '       PP.INSCRICAODATA,                                                               '+
                '       PP.DTINICIOINSC,                                                                '+
                '       DECODE(HST.SITRECEBIMENTO, ''0'', ''Não Enviadas'',                             '+
                '                                  ''1'', ''Não Recebidas'',                            '+
                '                                  ''2'', ''Recebidas sem Divergência'',                '+
                '                                  ''3'', ''Recebidas com Divergência(NT)'',            '+
                '                                  ''4'', ''Recebidas com Divergência(T)'',             '+
                '                                  ''5'', ''Divergência Tratada e Paga'',               '+
                '                                  ''6'', ''Divergência Tratada Não Paga'',             '+
                '                                  ''7'', ''Financiadas ou Renegociadas'',              '+
                '                                  ''8'', ''Canceladas'',                               '+
                '                                  ''9'', ''Atrasadas a cobrar na Folha Benef. '',      '+
                '                                  ''Outros'')                                          '+
                ' FROM   PESSOA P,               CONTRIBUICAO C,        HSTCONTRIBPREV HST,             '+
                '        ELEGPATRO EL,           PARTPREVPLAN PP,       PLANPREV PL,                    '+
                '        PESSOA PAT,             PARAMAPREV PARAM                                       '+
                ' WHERE  (P.IDPESSOA         = '+sIdPessoa+')                                           '+
                ' AND    (EL.IDPESSJUR       = '+sIdPessJur+')                                          '+
                ' AND    (EL.IDPESSOA        = P.IDPESSOA)                                              '+
                ' AND    (EL.IDPESSJUR       = PAT.IDPESSOA)                                            '+
                ' AND    (PP.IDPESSJUR       = EL.IDPESSJUR)                                            '+
                ' AND    (PP.IDPESSOA        = EL.IDPESSOA)                                             '+
                ' AND    (PP.IDPLANOPREV     = PL.IDPLANOPREV)                                          '+
                ' AND    (PP.FLGDESATIVADO = 0)                                                         '+
                ' AND    (HST.IDPESSOA       = P.IDPESSOA)                                              '+
                ' AND    (HST.IDCONTRIBUICAO = C.IDCONTRIBUICAO)                                        ');
        if Trim(sAnoMesReferencia) <> ''
        then SQL.Add(' AND (HST.MESREFERENCIA >= '''+sAnoMesReferencia+''')                                ');

        SQL.Add(' ORDER BY P.NOME, HST.MESREFERENCIA, C.NOME                                            ');
        Open;
     end;
  end;

  inherited;
end;

end.
