// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
{
  // Higor Nayde SOL 250046 - Validação retirada pois nao consta na EF
--------------------------------------------------------------------------------
 Pendência   : SIG 112971
 Responsável : André Imakawa
 Data        : 14/12/2021
 Descrição   : Regra para quantidade de alterações.
--------------------------------------------------------------------------------
 Pendência   : SOL 250046 PPM
 Responsável : Higor Nayde
 Data        : 13/03/2014
 Descrição   : Validação de Percentual retirada pois nao consta na EF
--------------------------------------------------------------------------------
 Pendência   : SOL 227885 KINTANA 2061961
 Responsável : Marcio Sanches Spinosa SOL 227885 KINTANA 2061961
 Data        : 13/03/2014
 Descrição   : Ajuste na validação do campo valores
--------------------------------------------------------------------------------

 Pendência   : SOL 205971 KINTANA 1995977
 Responsável : Flávio Antonio de Souza
 Data        : 14/08/2013
 Descrição   : A busca das matrículas deve se baser no campo IDSITPART e nõ no campo IDSITFUNC. 
--------------------------------------------------------------------------------
 Pendência   : SOL 179143 KINTANA 1653010
 Responsável : BRUNO AZEVEDO
 Data        : 04/05/2012
 Descrição   : Ajustes ao alterar o percentual em lote das contribuições.
--------------------------------------------------------------------------------
 Autor(a)    : Fernando Xavier
 Data        : 20/05/2011
 Pendência   : SOL 136169 Kintana 840846
 Alteração   : solicito alteração no aplicativo de alteração de percentual e lote referente ao SOL 127144
------------------------------------------------------------------------------
 Autor(a)    : Renato Visoni
 Data        : 05/04/2010
 Pendência   : SOL 127144 Kintana 670910
 Alteração   : Criaçã da funcionalidade "Alteração de Percentual de Contribuição em Lote"
------------------------------------------------------------------------------
}
unit uBuscaContribPartLote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, uMensErro, Wwdatsrc,
  wwdblook, DBCtrls, TREdit, Mask, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmBuscaContribPartLote = class(TfrmOkCancelar)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtMatricula: TEdit;
    edtNome: TEdit;
    edtPercAtual: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    btnBusca: TBitBtn;
    QryPlano: TQuery;
    dsPlano: TDataSource;
    cboPlano: TDBLookupComboBox;
    cboContribuicao: TDBLookupComboBox;
    qryContribuicao: TQuery;
    dsContribuicao: TDataSource;
    lstContribuicao: TListBox;
    edtNovoPerc: TEdit;
    Label10: TLabel;
    dtDataCaixa: TCMDateTimePicker;
    CMDateTimePicker1: TCMDateTimePicker;
    Label9: TLabel;
    Label11: TLabel;
    qryPlanPrev: TwwQuery;
    qryAux2: TwwQuery;
    procedure btnBuscaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtMatriculaKeyPress(Sender: TObject; var Key: Char);
    procedure bt(Sender: TObject; var Key: Char);
    procedure edtMatriculaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cboContribuicaoCloseUp(Sender: TObject);
    procedure cboPlanoCloseUp(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure qryContribuicaoAfterScroll(DataSet: TDataSet);
    procedure QryPlanoAfterScroll(DataSet: TDataSet);
    procedure edtNovoPercKeyPress(Sender: TObject; var Key: Char);

  private
    Procedure LimparCampos();
    { Private declarations }
  public
    idPessoa       : String;
    sMatricula     : String;
    sRowId         : String;
    sDataVigente   : String;
    sInscricaoData : String;
    sTipoArquivo   : String;
    sidPessJur     : String;
    { Public declarations }
  end;

var
  frmBuscaContribPartLote: TfrmBuscaContribPartLote;

implementation
  uses uAltPercContribLote,uFuncoesUteis,udiasuteis,uSistema;
{$R *.DFM}

procedure TfrmBuscaContribPartLote.btnBuscaClick(Sender: TObject);
var QryAux   : TwwQuery;

begin

  //inherited;
  sidPessJur   :='';
  idPessoa     :='';
  sMatricula   :='';
  sDataVigente :='';
  sInscricaoData:='';

  if trim(edtMatricula.Text) <> '' then begin
    QryAux              := TwwQuery.Create(Nil);
    QryAux.DataBaseName := 'BaseDados';
    QryAux.Close;
    QryAux.SQL.Clear;

    QryAux.SQL.Add(' SELECT IDPESSOA, NOME ');
    QryAux.SQL.Add(' FROM PESSOA ');

    // Flávio Antonio de Souza SOL: 205971 Kintana: 1995977

     {  Pesquisa anterior:
     
         QryAux.SQL.Add(' WHERE IDPESSOA IN (SELECT IDPESSOA ');
         QryAux.SQL.Add('                    FROM ELEGPATRO ');
         QryAux.SQL.Add('                    WHERE MATRICULA =' + QuotedStr(edtMatricula.Text));
         QryAux.SQL.Add('                    AND IDSITFUNC IN (8,33) ');
         QryAux.SQL.Add('                    AND ROWNUM = 1) ');
     }

    QryAux.SQL.Add(' WHERE IDPESSOA IN (SELECT E.IDPESSOA ');
    QryAux.SQL.Add('                    FROM ELEGPATRO E, PARTPREVPLAN P ');
    QryAux.SQL.Add('                    WHERE E.MATRICULA =' + QuotedStr(edtMatricula.Text));
    QryAux.SQL.Add('                    AND P.IDSITPART IN (1,2,33,77) ');
    QryAux.SQL.Add('                    AND E.IDPESSOA = P.IDPESSOA ');
    QryAux.SQL.Add('                    AND ROWNUM = 1) ');

   // Flávio Antonio de Souza SOL: 205971 Kintana: 1995977

    QryAux.Open;


    if (QryAux.RecordCount = 0) then begin
      MsgDlg('Matrícula não encontrada ou Titular não esta Ativo. ', 'Informação', mtConfirmation, [mbOk], 0);
      QryPlano.Close;
      QryContribuicao.Close;

      LimparCampos;
      QryPlano.Close;
      QryContribuicao.Close;
      edtMatricula.SetFocus;
    end else begin
      edtNome.Text   := QryAux.FieldByname('NOME').asString;
      idPessoa       := QryAux.FieldByname('IDPESSOA').asString;
      sMatricula     := edtMatricula.Text;

      QryPlano.Close;
      QryPlano.ParamByname('IDPESSOA').asString := QryAux.FieldByname('IDPESSOA').asString;
      QryPlano.Open;

      if QryPlano.Locate('IDSITPLANOPREV','1',[]) then begin
        cboPlano.KeyValue := QryPlano.FieldByname('IDPLANOPREV').AsString;
        cboPlano.OnCloseUp(Sender);
      end else begin
        MsgDlg('Não existe plano ativo para a matrícula informada. ', 'Informação', mtConfirmation, [mbOk], 0);
        LimparCampos;
        Exit;
      end;
    end;


    QryAux.Close;
    QryAux.SQL.Clear;
    QryAux.SQL.Add(' SELECT  TO_DATE(01||''/''||TO_CHAR(SYSDATE,''MM/YYYY''),''DD/MM/YYYY'')AS DATAVIGENTE FROM DUAL ');
    QryAux.Open;

    sDataVigente := QryAux.fieldByname('DATAVIGENTE').asString;

    //CMDateTimePicker1.text := sDataVigente;
    CMDateTimePicker1.text := datetostr(F_Diasuteis());

    QryAux.Destroy;

  end;



end;

procedure TfrmBuscaContribPartLote.FormCreate(Sender: TObject);
var Auxdate:tdate;
begin
 // inherited;
  Auxdate := now;
  qryPlanPrev.Close; // Andre Imakawa - SIG 112971
  qryPlanPrev.Open;  // Andre Imakawa - SIG 112971

   {if Auxdate < StrToDate(('06'+FormatDateTime('/mm/yyyy',now))) then
      dtDataCaixa.Date := StrToDate('01'+FormatDateTime('/mm/yyyy',IncMonth(Auxdate,-1)))
   else
      dtDataCaixa.Date := StrToDate('01'+FormatDateTime('/mm/yyyy',Auxdate));

   if not DiasUteis.DiaUtil(Sistema.IdEmpresa,dtDataCaixa.Date, false,false,false) then
      dtDataCaixa.Date := DiasUteis.PrimeiroDiaUtilPosterior(Sistema.IdEmpresa,dtDataCaixa.Date, false,false,false); }
   dtDataCaixa.Date := F_Diasuteis();
end;

procedure TfrmBuscaContribPartLote.edtMatriculaKeyPress(Sender: TObject;
  var Key: Char);
begin
  //inherited;

  if (not (key in ['0'..'9'])) and  (key <> #8)
    then key :=#0;


end;

procedure TfrmBuscaContribPartLote.bt(Sender: TObject;
  var Key: Char);
begin
  //inherited;

  if (not (key in ['0'..'9'])) and  (key <> #8)
    then key :=#0;

end;

procedure TfrmBuscaContribPartLote.edtMatriculaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  //inherited;

  if Key = VK_RETURN then btnBusca.click;

end;

procedure TfrmBuscaContribPartLote.cboContribuicaoCloseUp(Sender: TObject);
begin
  inherited;

  if QryContribuicao.Active then begin
    edtPercAtual.Text := QryContribuicao.FieldByname('VALORBASE1').AsString;
  end;

end;

procedure TfrmBuscaContribPartLote.cboPlanoCloseUp(Sender: TObject);
begin
  inherited;
  sRowId :='';

  if QryPlano.Active then begin
    edtPercAtual.text :='';
    QryContribuicao.Close;
    QryCOntribuicao.ParamByname('IDPESSOA').asString    := idPessoa;
    QryCOntribuicao.ParamByname('IDPESSJUR').asString   := QryPlano.FieldByname('IDPESSJUR').asString;
    QryCOntribuicao.ParamByname('IDPLANOPREV').asString := QryPlano.FieldByname('IDPLANOPREV').asString;
    QryContribuicao.Open;

    lstContribuicao.Clear;
    QryContribuicao.First;
    edtPercAtual.enabled := true;
    while not QryContribuicao.eof do begin
      lstContribuicao.Items.Add(QryContribuicao.FieldByname('NOME').asString+'  -  '+QryContribuicao.FieldByname('VALORBASE1').asString+' %');
      //BRUNO AZEVEDO SOL 179143 KINTANA 1653010
      if (QryContribuicao.FieldByName('IDCONTRIBUICAO').AsString = '1') then begin
        edtPercAtual.text := QryContribuicao.FieldByname('VALORBASE1').asString;
      end;
      //BRUNO AZEVEDO SOL 179143 KINTANA 1653010
      QryContribuicao.next;
    end;
    edtPercAtual.enabled := false;
  end;

end;

procedure TfrmBuscaContribPartLote.bbtnConfirmarClick(Sender: TObject);
var sCampos : String;
I : INTEGER;
sNovoPercentual, sPercentualAtual : string;
iLimite, iParam264: Integer;
sSQL : string;
begin
  inherited;


  sDataVigente := CMDateTimePicker1.Text;

  if (trim(edtMatricula.Text)='') or  (Trim(cboPlano.Text)='') or
     {or (Trim(cboContribuicao.Text)='')  or(Trim(edtPercAtual.text)='') or}
     (trim(edtNovoPerc.text) = '')  or (trim(CMDateTimePicker1.text) = '') then begin
     MsgDlg('Todos os campos devem ser preenchidos. ', 'Informação', mtConfirmation, [mbOk], 0);
     exit;
  end;

  if (strToFloat(edtNovoPerc.Text) > 100) then
  begin
     MsgDlg('O percentual não pode ser maior que 100%. ', 'Informação', mtConfirmation, [mbOk], 0);
     edtNovoPerc.text :='';
     exit;
  end;

  if (cboPlano.KeyValue = 74) then begin
     if strToFloat(edtNovoPerc.Text) < 5 then
     begin
        MsgDlg('O percentual mínimo para Novo Plano não pode ser menor que 5%. ', 'Informação', mtConfirmation, [mbOk], 0);
        edtNovoPerc.text :='';
        exit;
     end
  end;

  if (cboPlano.KeyValue = 66) then begin
    if strToFloat(edtNovoPerc.Text) < 2 then begin
      MsgDlg('O percentual mínimo para REB não pode ser menor que 2%. ', 'Informação', mtConfirmation, [mbOk], 0);
      edtNovoPerc.text :='';
      exit;
    end;
  end;
  // Higor Nayde SOL 250046 - Validação retirada pois nao consta na EF
  {qryContribuicao.First;
  While not qryContribuicao.EOF do begin
    if StrToFloat(StringReplace(QryContribuicao.FieldByname('VALORBASE1').AsString,'.',',',[rfReplaceall])) = StrToFloat(StringReplace((edtNovoPerc.Text),'.',',',[rfReplaceall])) then begin
      MsgDlg('O novo percentual deverá ser diferente do percentual atual. ', 'Informação', mtConfirmation, [mbOk], 0);
      exit;
    end;
    qryContribuicao.Next;
  end;
  }


  qryContribuicao.First;
  While not qryContribuicao.EOF do begin
    sTipoArquivo :='';

    if FrmAltPercContribLote.ParticipanteProcessado('IDROWID = '+Trim(QuotedStr(sRowId))) then begin
      MsgDlg('Matrícula já selecionada. ', 'Informação', mtConfirmation, [mbOk], 0);
      LimparCampos();
      Exit;
    end;

    // Andre Imakawa - SIG 112971 - Inicio    
    try                                   
      if qryPlanPrev.Locate('IDPLANOPREV',cboPlano.KeyValue,[]) then
        iLimite := qryPlanPrev.FieldByName('LIMITEMUDANCAPERC').AsInteger
      else
        iLimite := 0;

      sSQL := 'SELECT COUNT(1) AS QTD_PARAM264' +#13
       + ' FROM PESSOAPARAM '                   +#13
       + ' WHERE IDPARAM = 264 '                +#13
       + ' AND TO_CHAR(DATAINICIO,''MM/YYYY'') = TO_CHAR(TO_DATE('+ Trim(QuotedStr(DateToStr(dtDataCaixa.Date))) +',''DD/MM/YYYY''),''MM/YYYY'')' +#13
       + ' AND IDPESSOA ='+ Trim(QuotedStr(idPessoa)) +#13
       + ' AND VALOR = ''S'' ' ;
      QryAux2.Close;
      QryAux2.SQL.CLear;
      QryAux2.SQL.Add(sSQL);
      QryAux2.Open;

      iParam264 := QryAux2.Fieldbyname('QTD_PARAM264').AsInteger;

      QryAux2.Close;
      QryAux2.SQL.CLear;
      QryAux2.SQL.Add('SELECT COUNT(1) QTD FROM HSTPERCONTRIBPREV');
      QryAux2.SQL.Add(' WHERE IDPESSJUR    = '+Trim(QuotedStr(sidPessJur)));
      QryAux2.SQL.Add(' AND DTINICIO IS NOT NULL ');
      QryAux2.SQL.Add(' AND IDPESSOA       = '+Trim(QuotedStr(idPessoa)));
      QryAux2.SQL.Add(' AND IDPLANOPREV    = '+trim(QuotedStr(cboPlano.KeyValue)));
      QryAux2.SQL.Add(' AND IDCONTRIBUICAO = '+Trim(QuotedStr(qryContribuicao.Fieldbyname('IDCONTRIBUICAO').asString)));
      QryAux2.SQL.Add('AND EXTRACT(YEAR FROM DTINICIO) = EXTRACT(YEAR FROM TO_DATE('+ Trim(QuotedStr(DateToStr(dtDataCaixa.Date))) +',''DD/MM/YYYY''))');
      QryAux2.Open;

      if iLimite > 0 then
      begin
        if iLimite <=  QryAux2.Fieldbyname('QTD').AsInteger then
        begin
          if iParam264 = 0 then
          begin
            MsgDlg('Quantidade de alterações de percentual superior à estabelecida, sem parâmetro 264.', 'Informação', mtConfirmation, [mbOk], 0);
            LimparCampos();
            Exit;
          end;
        end;
      end;

    except

    end;  
    // Andre Imakawa - SIG 112971 - Fim


    sNovoPercentual  :='';
    sPercentualAtual :='';
 //Marcio Sanches Spinosa SOL 227885 KINTANA 2061961 - Inicio
//    sPercentualAtual := StringReplace(QryContribuicao.FieldByname('VALORBASE1').AsString,',','.',[rfReplaceall]);
//    sNovoPercentual  := StringReplace((edtNovoPerc.Text),',','.',[rfReplaceall]);

    sPercentualAtual := QryContribuicao.FieldByname('VALORBASE1').AsString;
    sNovoPercentual  := edtNovoPerc.Text;
    //Marcio Sanches Spinosa SOL 227885 KINTANA 2061961 - Fim


    if strToFloat(copy(Trim(sNovoPercentual),pos('.',sNovoPercentual)+1, Length(sNovoPercentual)))=0 then begin
      sNovoPercentual := Copy(sNovoPercentual,1,pos('.',sNovoPercentual)-1);
    end;
    
    if cboPlano.KeyValue = 66 then begin
      sTipoArquivo := '0013';
    end else if cboPlano.KeyValue = 74 then begin
      sTipoArquivo :='0015';
    end;
    // SOL 136169
    //Deverá ser retirada a crítica de percentual maximo apenas para a Patrocinadora (idcontribuicao=21),
    // internamente sera feita a verificação e os percentuais limitados 7% e 12%, respectivamente,
    //para os planos previdenciários de códigos 66 (REB) e 74 (NOVO PLANO).
    if qryContribuicao.Fieldbyname('IDCONTRIBUICAO').Asinteger = 21  then
    begin
      if (cboPlano.KeyValue = 74) then begin
         if strtofloat(sNovoPercentual) > 12 then
            sNovoPercentual := '12';
      end;

      if (cboPlano.KeyValue = 66) then begin
         if strtofloat(sNovoPercentual) > 7 then
            sNovoPercentual := '7';
      end;

    end;

 //Marcio Sanches Spinosa SOL 227885 KINTANA 2061961 - Inicio
    sPercentualAtual := StringReplace(QryContribuicao.FieldByname('VALORBASE1').AsString,',','.',[rfReplaceall]);
    sNovoPercentual  := StringReplace((edtNovoPerc.Text),',','.',[rfReplaceall]);
//Marcio Sanches Spinosa SOL 227885 KINTANA 2061961 - Fim    

    sCampos :=  QuotedStr(sMatricula+'        ')           +   ' AS MATRICULA,      '+
                Trim(QuotedStr(edtNome.text))              +   ' AS NOME,           '+
                trim(QuotedStr(cboPlano.KeyValue))         +   ' AS IDPLANOPREV,    '+
                QuotedStr(cboPlano.Text+'        ')        +   ' AS PLANO,          '+
                Trim(QuotedStr(qryContribuicao.Fieldbyname('IDCONTRIBUICAO').asString))  +   ' AS IDCONTRIBUICAO, '+
                //Trim(QuotedStr(qryContribuicao.Fieldbyname('NOME').asString))      +   ' AS CONTRIBUICAO,   '+
                QuotedStr(sPercentualAtual+'              ')+  ' AS PERCETUAL_ATUAL, '+
                QuotedStr(sNovoPercentual+'               ')+  ' AS PERCENTUAL_NOVO, '+
                Trim(QuotedStr(sRowId))                     +   ' AS IDROWID,        '+
                Trim(QuotedStr(sDataVigente))               +   ' AS DATA,     '+
                QuotedStr(sTipoArquivo+'       ')           +   ' AS TIPO_ARQUIVO,     '+
                Trim(QuotedStr(sidPessJur))                 +   ' AS IDPESSJUR,     '   +
                Trim(QuotedStr(idPessoa))                   +   ' AS IDPESSOA,     '   +
                Trim(QuotedStr(DateToStr(dtDataCaixa.Date)))+   ' AS DATACAIXA,     '+
                Trim(QuotedStr(sInscricaoData))             +   ' AS INSCRICAODATA     '
                ;

    FrmAltPercContribLote.lstCampos.Add(sCampos);

    qryContribuicao.Next;
  end;

  LimparCampos();
  FrmAltPercContribLote.ListaHistorico();
  sCampos :='';

end;

procedure TfrmBuscaContribPartLote.qryContribuicaoAfterScroll(
  DataSet: TDataSet);
begin
  inherited;

  if QryContribuicao.Active then begin
    sRowId     := QryContribuicao.FieldByname('ROWID').asString;
    sidPessJur := QryContribuicao.FieldByname('IDPESSJUR').asString;
  end;
end;

procedure TfrmBuscaContribPartLote.QryPlanoAfterScroll(DataSet: TDataSet);
begin
  inherited;

  if QryPlano.Active then
    sInscricaoData := QryPlano.fieldbyName('InscricaoData').asString;

end;

procedure TfrmBuscaContribPartLote.LimparCampos;
begin
  CMDateTimePicker1.Text   :='';
  edtMatricula.Text        :='';
  edtNome.Text             :='';
  edtPercAtual.text        :='';
  edtNovoPerc.Text         :='';
  cboPlano.KeyValue        :=NULL;
  lstContribuicao.Clear;
  QryPlano.Close;
  QryContribuicao.Close;
  edtMatricula.SetFocus;

end;

procedure TfrmBuscaContribPartLote.edtNovoPercKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;

  if (pos(',',edtNovoPerc.Text)>0) and (key = ',')
  then key :=#0;

  if (not (key in ['0'..'9'])) and (key <> #8) and (key<>',')
    then key :=#0;

end;

end.
