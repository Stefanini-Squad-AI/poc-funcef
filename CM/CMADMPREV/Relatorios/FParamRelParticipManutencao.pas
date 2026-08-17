// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 07.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
// Autor       : Camille
// Data        : 30/07/2002
// Alteração   : Acrescimo do IDPLANOPREV NA QUERY pois este campo é utilizado
//               no DtmRelatAdmprev para montar o relatorio
// *****************************************************************************
unit FParamRelParticipManutencao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Mask, wwdblook, Db, Wwdatsrc, DBTables, Wwquery;

type
  TfrmParamRelParticipManutencao = class(TfrmOkCancelar)
    qryPatro: TwwQuery;
    dsPatro: TwwDataSource;
    Label1: TLabel;
    dblkcmbPatrocinadora: TwwDBLookupCombo;
    Label5: TLabel;
    cbxMes: TComboBox;
    medAno: TMaskEdit;
    Label7: TLabel;
    rgrTipoCobranca: TRadioGroup;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamRelParticipManutencao: TfrmParamRelParticipManutencao;

implementation

uses DRelatAdmPrev, UMensErro, UAdmPrev;

{$R *.DFM}

procedure TfrmParamRelParticipManutencao.bbtnConfirmarClick(
  Sender: TObject);
var sErros, sFlgDevolucao : String;
begin
  inherited;
  bbtnConfirmar.SetFocus;
  sErros := '';

  // Valida a patrocinadora
  If (dblkcmbPatrocinadora.Text = '') Then
    sErros := sErros + 'A Patrocinadora deve ser preenchida; '+chr(13);
  // Valida o mês base
  If (Length(Trim(cbxMes.Text)) < 1) Then
    sErros := sErros + 'O MÊS base deve ser preenchido; '+chr(13);
  // Valida o ano base
  If (Length(Trim(medAno.Text)) < 1) Then
    sErros := sErros + 'O ANO base deve ser preenchido; '+chr(13);
  // Valida o tipo de cobrança
  If (rgrTipoCobranca.ItemIndex = -1) Then
    sErros := sErros + 'O tipo de cobrança deve ser preenchido; '+chr(13);

  If sErros <> '' Then
    begin
      MsgDlg(sErros, 'Erro(s)', mtError, [mbOk], 0);
      dblkcmbPatrocinadora.SetFocus;
      EXIT;
    end;

  with dtmRelatAdmPrev do
  begin
      //  OBTER DADOS DA FUNDAÇÃO
      qryFundacao.Close;
      qryFundacao.ParamByName('pFundacao').asinteger;
      qryFundacao.ParamByName('pFundacao').asinteger := iIdFundacao;
      qryFundacao.Prepare;
      qryFundacao.Open;

      If cbxMes.Text = '13º Salário'
      Then  pplblMesAno.Caption := cbxMes.Text
      else  pplblMesAno.Caption := Copy(cbxMes.Text,1,2) + '/' + medAno.Text;

      If (rgrTipoCobranca.ItemIndex = 0)
      Then pplblTipoCobranca.Caption := 'CONTRIBUIÇÕES EM ATRASO'
      else If (rgrTipoCobranca.ItemIndex = 1)
      Then pplblTipoCobranca.Caption := 'CONTRIBUIÇÕES A DEVOLVER/DEVOLVIDAS'
      else If (rgrTipoCobranca.ItemIndex = 2)
      Then pplblTipoCobranca.Caption := 'TODOS';

      if rgrTipoCobranca.ItemIndex = 1
      then sFlgDevolucao := '1'
      else sFlgDevolucao := '0';

      // Prepara a query dos participantes em manutenção
      qryParticipManut.Close;
      qryParticipManut.SQL.Clear;
      qryParticipManut.SQL.Add(
        ' SELECT 1 AS CONTADOR, ELP.IDPESSJUR, ELP.IDPESSOA, ELP.MATRICULA, PSS.NOME,         '+
        '        PPP.IDPLANOPREV,                                                             '+ 
        '        NVL(REG.NOME,''Patrocinadora sem Regional'') AS REGIONAL,     '+
        '        PPP.DATAINICIOASSIST,   EVP.DATAVOLTA, SP.FLGINTERNO,                        '+
        sFlgDevolucao+ ' AS FLGDEVOLUCAO, '+
        ''''+medAno.Text+'/'+Copy(cbxMes.Text,1,2)+''' AS MESREFERENCIA        '+
        ' FROM   PATRO PTR, EVENTOSPREV EVP, EVENTOGERADOR EVG, ELEGPATRO ELP, '+
        '        PARTPREVPLAN PPP, PESSOA PSS, PESSOA REG, SITPART SP          '+
        ' WHERE  (PTR.IDPESSOA    =   '+qryPatro.FieldByName('IDPESSOA').AsString+') '+
        ' and    (ppp.idpessjur   = ptr.idpessoa)                              '+
        ' and    (ppp.idpessjur   = elp.idpessjur)                             '+
        ' and    (ppp.idpessoa    = elp.idpessoa)                              '+
        ' and    (ppp.idpessoa    = pss.idpessoa)                              '+
        ' and    (ppp.idsitpart   = sp.idsitpart)                              '+
        ' and    (elp.idestab     = reg.idpessoa(+))                           '+
        ' and    (evp.IDPESSJUR   = ppp.idpessjur)                             '+
        ' and    (evp.idplanoprev = ppp.idplanoprev)                           '+
        ' and    (evp.IDPESSOA    = ppp.idpessoa)                              '+
        ' and    (evp.seqproposta = ppp.seqproposta)                           '+
        ' and    (TO_CHAR(evp.DATAEVENTO,''YYYY/MM'') <= '''+medAno.Text+'/'+Copy(cbxMes.Text,1,2)+''') '+
        ' and    ((TO_CHAR(evp.DATAVOLTA, ''YYYY/MM'') >= '''+medAno.Text+'/'+Copy(cbxMes.Text,1,2)+''') '+
        '     or (evp.DATAVOLTA IS NULL))                                      '+
        ' and   (evp.IDEVENTOGERADOR = evg.IDEVENTOGERADOR)                    '+
        ' and   (evg.FLGINTERNO IN (''DM'',''PD''))                            '+
        ' ORDER BY REG.NOME, ELP.MATRICULA ');
      qryParticipManut.Prepare;
      qryParticipManut.Open;

      qryHstContribPartP.Prepare;

  end;// with
end;

procedure TfrmParamRelParticipManutencao.FormCreate(Sender: TObject);
begin
  inherited;
  qryPatro.Close;
  qryPatro.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
  qryPatro.Prepare;
  qryPatro.Open;

  medAno.Text := FormatDateTime('yyyy',Date);
end;

procedure TfrmParamRelParticipManutencao.FormDestroy(Sender: TObject);
begin
  inherited;
  qryPatro.Close;
  qryPatro.UnPrepare;
  with dtmRelatAdmPrev do
    begin
      qryParticipManut.Close;
      qryParticipManut.UnPrepare;
      qryHstContribPartp.Close;
      qryHstContribPartp.UnPrepare;
    end;
end;

end.
