//------------------------------------------------------------------------------
//Pendência   : SOL 114575 KINTANA 535771
//Responsável : Jésica Lana
//Data        : 24/04/2009
//Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
//------------------------------------------------------------------------------
unit FExecBuscaSolicitante;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, ExtCtrls, ComCtrls, Grids, Wwdbigrd, Wwdbgrid,
  Db, DBTables, Wwquery, uFuncoesEmptmo;

type
  TfrmExecBuscaSolicitante = class(TFrmOkCancelarImob)
    qryResultado: TwwQuery;
    qryResultadoNOME: TStringField;
    qryResultadoMATRICULA_TIT: TStringField;
    qryResultadoMATRICULA: TStringField;
    qryResultadoINSCRICAO_TIT: TFloatField;
    qryResultadoCPF: TStringField;
    qryResultadoTIPO: TStringField;
    qryResultadoNOME_TIT: TStringField;
    qryResultadoCPF_TIT: TStringField;
    qryResultadoSIT_PART: TStringField;
    qryResultadoSIT_PLANO: TStringField;
    qryResultadoNOME_PATRO: TStringField;
    qryResultadoNOME_PLANO: TStringField;
    qryResultadoC12: TFloatField;
    qryResultadoC13: TFloatField;
    qryResultadoC14: TStringField;
    qryResultadoC15: TStringField;
    qryResultadoC16: TStringField;
    qryResultadoC17: TStringField;
    qryResultadoC18: TStringField;
    qryResultadoC19: TStringField;
    qryResultadoC20: TFloatField;
    qryResultadoC21: TStringField;
    qryResultadoC22: TStringField;
    qryResultadoC23: TFloatField;
    qryResultadoC24: TFloatField;
    qryResultadoC25: TStringField;
    qryResultadoC26: TFloatField;
    qryResultadoC27: TStringField;
    qryResultadoC28: TStringField;
    dsResultado: TDataSource;
    btnOK: TBitBtn;
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    Label11: TLabel;
    cboPlano: TComboBox;
    edtPlano: TEdit;
    chkPlano: TCheckBox;
    Panel2: TPanel;
    Label10: TLabel;
    cboPatro: TComboBox;
    edtPatro: TEdit;
    chkPatro: TCheckBox;
    Panel3: TPanel;
    Label9: TLabel;
    cboSituacaoPlano: TComboBox;
    edtSitPlano: TEdit;
    chkSitPlano: TCheckBox;
    Panel4: TPanel;
    Label8: TLabel;
    cboSituacaoFund: TComboBox;
    edtSituacao: TEdit;
    chkSitFund: TCheckBox;
    Panel5: TPanel;
    Label7: TLabel;
    cboCPFTIT: TComboBox;
    edtCPFTit: TEdit;
    chkCPFTit: TCheckBox;
    Panel6: TPanel;
    Label6: TLabel;
    cboNomeTitular: TComboBox;
    edtNomeTit: TEdit;
    chkNomeTit: TCheckBox;
    Panel7: TPanel;
    Label5: TLabel;
    cboCPF: TComboBox;
    edtCpf: TEdit;
    chkCPF: TCheckBox;
    Panel8: TPanel;
    Label4: TLabel;
    cboInscricao: TComboBox;
    edtInscricaoPrev: TEdit;
    chkInscricao: TCheckBox;
    Panel9: TPanel;
    Label3: TLabel;
    cboMatricula: TComboBox;
    edtMatricula: TEdit;
    chkMatricula: TCheckBox;
    Panel10: TPanel;
    Label2: TLabel;
    cboMatrTit: TComboBox;
    edtMatrTit: TEdit;
    chkMatrTit: TCheckBox;
    Panel11: TPanel;
    Label1: TLabel;
    cboNome: TComboBox;
    edtNome: TEdit;
    chkNome: TCheckBox;
    TabSheet2: TTabSheet;
    wwDBGrid1: TwwDBGrid;
    qrySituacaoParticipante: TwwQuery;
    qrySituacaoParticipanteFLGINTERNO: TStringField;
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure wwDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FRetornouValor : Boolean;
    sSql           : String;

    procedure MontaQueryComum;
    function  MontaQueryPrincipal : Boolean;
    procedure MontaQuerySecundaria;
    function  MontaFiltro : Boolean;
    function  RetornaTabela(sMatricula : String) : String;

  public
    { Public declarations }
    ValoresChave : array[0..16] of String;
    property RetornouValor : Boolean   read FRetornouValor  write FRetornouValor;
  end;

var
  frmExecBuscaSolicitante: TfrmExecBuscaSolicitante;

implementation

{$R *.DFM}
uses USistema;


procedure TfrmExecBuscaSolicitante.bbtnCancelarClick(Sender: TObject);
begin
  qryResultado.Close;
end;



procedure TfrmExecBuscaSolicitante.bbtnConfirmarClick(Sender: TObject);
begin
   if MontaQueryPrincipal then begin
      if qryResultado.IsEmpty then begin
         MontaQuerySecundaria;
      end;

      PageControl.ActivePageIndex := 1;
      PageControlChange(Self);
      FRetornouValor := not qryResultado.IsEmpty;
   end;
end;



procedure TfrmExecBuscaSolicitante.MontaQueryComum;
begin
   sSql :=
   'SELECT '                                                                                                           + #13 +
   '   DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NOME, PDP.NOME) AS NOME, '                                              + #13 +
   '   ELP.MATRICULA AS MATRICULA_TIT, '                                                                               + #13 +
   '   DECODE(DEP.IDTITULAR, NULL, '''', DEP.IDPESSOA, ELP.MATRICULA, DEP.MATRICULA) AS MATRICULA, '                     + #13 +
   '   PPP.INSCRICAONUMERO AS INSCRICAO_TIT, '                                                                         + #13 +
   '   DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO) AS CPF, '                               + #13 +
   '   DECODE(DEP.IDTITULAR, NULL, ''Não Participante'', DEP.IDPESSOA, ''Participante'', ''Dependente'') AS TIPO, '    + #13 +
   '   PEP.NOME AS NOME_TIT, '                                                                                         + #13 +
   '   PEP.NUMDOCUMENTO AS CPF_TIT, '                                                                                  + #13 +
   '   SIP.DESCRICAO AS SIT_PART, '                                                                                    + #13 +
   '   SPP.DESCRICAO AS SIT_PLANO, '                                                                                   + #13 +
   '   PPA.NOME AS NOME_PATRO, '                                                                                       + #13 +
   '   PLP.NOME AS NOME_PLANO, '                                                                                       + #13 +
   '   DEP.IDPESSOA AS C12, '                                                                                          + #13 +
   '   DEP.IDTITULAR AS C13, '                                                                                         + #13 +
   '   DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NOME, PDP.NOME) AS C14, '                                               + #13 +
   '   DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO) AS C15, '                               + #13 +
   '   DECODE(DEP.IDTITULAR, NULL, '''', DEP.IDPESSOA, ELP.MATRICULA, DEP.MATRICULA) AS C16, '                           + #13 +
   '   PEP.NOME AS C17, '                                                                                              + #13 +
   '   PEP.NUMDOCUMENTO AS C18, '                                                                                      + #13 +
   '   ELP.MATRICULA AS C19, '                                                                                         + #13 +
   '   PPP.INSCRICAONUMERO AS C20, '                                                                                   + #13 +
   '   PPA.NOME AS C21, '                                                                                              + #13 +
   '   PLP.NOME AS C22, '                                                                                              + #13 +
   '   ELP.IDPESSJUR AS C23, '                                                                                         + #13 +
   '   PPP.IDPLANOPREV AS C24, '                                                                                       + #13 +
   '   SIP.DESCRICAO AS C25, '                                                                                         + #13 +
   '   SIP.IDSITPART AS C26, '                                                                                         + #13 +
   '   SPP.DESCRICAO AS C27, '                                                                                         + #13 +
   '   SIP.FLGINTERNO AS C28 '                                                                                         + #13 +
   'FROM '                                                                                                             + #13 +
   '   PESSOA       PDP, '                                                                                             + #13 +
   '   PESSOA       PEP, '                                                                                             + #13 +
   '   PESSOA       PPA, '                                                                                             + #13 +
   '   DEPENTIT     DEP, '                                                                                             + #13 +
   '   ELEGPATRO    ELP, '                                                                                             + #13 +
   '   PARTPREVPLAN PPP, '                                                                                             + #13 +
   '   PLANPREV     PLP, '                                                                                             + #13 +
   '   SITPART      SIP, '                                                                                             + #13 +
   '   SITPLANOPREV SPP '                                                                                              + #13;
end;




function TfrmExecBuscaSolicitante.MontaQueryPrincipal : Boolean;
begin
   Result := True;

   MontaQueryComum;

   sSql := sSql +
   'WHERE '                                                                + #13 +
   '       ELP.IDPESSOA       = PEP.IDPESSOA  '                            + #13 +
   '   AND ELP.IDPESSJUR      = PPA.IDPESSOA  '                            + #13 +
   '   AND ELP.IDPESSJUR      = PPP.IDPESSJUR  '                           + #13 +
   '   AND ELP.IDPESSOA       = PPP.IDPESSOA  '                            + #13 +
   '   AND ELP.IDPESSOA       = DEP.IDTITULAR(+)  '                        + #13 +
   '   AND DEP.IDPESSOA       = PDP.IDPESSOA(+)  '                         + #13 +
   '   AND PPP.IDPLANOPREV    = PLP.IDPLANOPREV '                          + #13 +
   '   AND PPP.IDSITPART      = SIP.IDSITPART '                            + #13 +
   '   AND PPP.IDSITPLANOPREV = SPP.IDSITPLANOPREV '                       + #13 +
   '   AND PPP.FLGDESATIVADO  = 0 '                                        + #13;

   if not MontaFiltro then
   begin
      if MessageDlg('Nenhum filtro foi especificado para a pesquisa. Isso pode levar algum tempo de processamento!. ', mtConfirmation, [mbYes,mbNo],0) = mrNo then
      begin
         Result := False;
         PageControl.ActivePageIndex := 0;
         Exit;
      end;
   end;

   with qryResultado do
   begin
      Sql.Text := sSql;
    //Jéssica Lana SOL 114575 24/04/2009
    //Sql.SaveToFile(Sistema.TempDir + 'EP-BuscaSolicitante.txt');
      Sql.SaveToFile(ftempregra + '\' + 'EP-BuscaSolicitante.txt');
      Open;
   end;
end;



procedure TfrmExecBuscaSolicitante.MontaQuerySecundaria;
begin
    MontaQueryComum;
    sSql := sSql +
    'WHERE '                                                               + #13 +
    '       ELP.IDPESSOA       = PEP.IDPESSOA '                            + #13 +
    '   AND ELP.IDPESSJUR      = PPA.IDPESSOA '                            + #13 +
    '   AND ELP.IDPESSJUR      = PPP.IDPESSJUR(+) '                        + #13 +
    '   AND ELP.IDPESSOA       = PPP.IDPESSOA(+) '                         + #13 +
    '   AND ELP.IDPESSOA       = DEP.IDTITULAR(+) '                        + #13 +
    '   AND DEP.IDPESSOA       = PDP.IDPESSOA(+) '                         + #13 +
    '   AND PPP.IDPLANOPREV    = PLP.IDPLANOPREV '                         + #13 +
    '   AND PPP.IDSITPART      = SIP.IDSITPART '                           + #13 +
    '   AND PPP.IDSITPLANOPREV = SPP.IDSITPLANOPREV '                      + #13 +
    '   AND PPP.FLGDESATIVADO  = 0 '                                       + #13;

    MontaFiltro;

    with qryResultado do begin
         Sql.Text := sSql;
         Open;
    end;
end;



function TfrmExecBuscaSolicitante.MontaFiltro : Boolean;
var stabela : String;
begin

    Result := False;
    if edtNome.Text <> '' then begin
       Result := True;
       case cboNome.ItemIndex of
            0 : begin
                  if chkNome.Checked then
                     sSql := sSql +  'AND UPPER(PEP.NOME) LIKE ''' + UpperCase(edtNome.Text) + '%''' + #13
                  else
                     sSql := sSql +  'AND PEP.NOME LIKE ''' + edtNome.Text + '%''' + #13;
                end;
            1 : begin
                  if chkNome.Checked then
                     sSql := sSql +  'AND UPPER(PEP.NOME) LIKE %''' + UpperCase(edtNome.Text) + '%''' + #13
                  else
                     sSql := sSql +  'AND PEP.NOME LIKE %''' + edtNome.Text + '%''' + #13;
                end;
            2 : begin
                  if chkNome.Checked then
                      sSql := sSql +  'AND UPPER(PEP.NOME) = ' + QuotedStr(UpperCase(edtNome.Text)) + #13
                   else
                      sSql := sSql +  'AND PEP.NOME = ' + QuotedStr(edtNome.Text) + #13;
                end;
            3 : begin
                  if chkNome.Checked then
                     sSql := sSql +  'AND UPPER(PEP.NOME) < ' + QuotedStr(UpperCase(edtNome.Text)) + #13
                  else
                     sSql := sSql +  'AND PEP.NOME < ' + QuotedStr(edtNome.Text) + #13;
                end;
            4 : begin
                  if chkNome.Checked then
                     sSql := sSql +  'AND UPPER(PEP.NOME) > ' + QuotedStr(UpperCase(edtNome.Text)) + #13
                  else
                      sSql := sSql +  'AND PEP.NOME > ' + QuotedStr(edtNome.Text) + #13;
                end;
            5 : begin
                  if chkNome.Checked then
                     sSql := sSql +  'AND UPPER(PEP.NOME) <= ' + QuotedStr(UpperCase(edtNome.Text)) + #13
                  else
                     sSql := sSql +  'AND PEP.NOME <= ' + QuotedStr(edtNome.Text) + #13;
                end;
            6 : begin
                  if chkNome.Checked then
                      sSql := sSql +  'AND UPPER(PEP.NOME) >= ' + QuotedStr(UpperCase(edtNome.Text)) + #13
                  else
                     sSql := sSql +  'AND PEP.NOME >= ' + QuotedStr(edtNome.Text) + #13;
                end;
       end;
    end;

    if edtMatrTit.Text <> '' then begin
       Result := True;
       case cboMatrTit.ItemIndex of
            0 : begin
                  if chkMatrTit.Checked then
                     sSql := sSql +  'AND UPPER(ELP.MATRICULA) LIKE ''' + UpperCase(edtMatrTit.Text) + '%''' + #13
                  else
                     sSql := sSql +  'AND ELP.MATRICULA LIKE ''' + edtMatrTit.Text + '%''' + #13;
                end;
            1 : begin
                  if chkMatrTit.Checked then
                     sSql := sSql +  'AND UPPER(ELP.MATRICULA) LIKE %''' + UpperCase(edtMatrTit.Text) + '%''' + #13
                  else
                     sSql := sSql +  'AND ELP.MATRICULA LIKE %''' + edtMatrTit.Text + '%''' + #13;
                end;
            2 : begin
                  if chkMatrTit.Checked then
                      sSql := sSql +  'AND UPPER(ELP.MATRICULA) = ' + QuotedStr(UpperCase(edtMatrTit.Text)) + #13
                   else
                      sSql := sSql +  'AND ELP.MATRICULA = ' + QuotedStr(edtMatrTit.Text) + #13;
                end;
            3 : begin
                  if chkMatrTit.Checked then
                     sSql := sSql +  'AND UPPER(ELP.MATRICULA) < ' + QuotedStr(UpperCase(edtMatrTit.Text)) + #13
                  else
                     sSql := sSql +  'AND ELP.MATRICULA < ' + QuotedStr(edtMatrTit.Text) + #13;
                end;
            4 : begin
                  if chkMatrTit.Checked then
                     sSql := sSql +  'AND UPPER(ELP.MATRICULA) > ' + QuotedStr(UpperCase(edtMatrTit.Text)) + #13
                  else
                      sSql := sSql +  'AND ELP.MATRICULA > ' + QuotedStr(edtMatrTit.Text) + #13;
                end;
            5 : begin
                  if chkMatrTit.Checked then
                     sSql := sSql +  'AND UPPER(ELP.MATRICULA) <= ' + QuotedStr(UpperCase(edtMatrTit.Text)) + #13
                  else
                     sSql := sSql +  'AND ELP.MATRICULA <= ' + QuotedStr(edtMatrTit.Text) + #13;
                end;
            6 : begin
                  if chkMatrTit.Checked then
                      sSql := sSql +  'AND UPPER(ELP.MATRICULA) >= ' + QuotedStr(UpperCase(edtMatrTit.Text)) + #13
                  else
                     sSql := sSql +  'AND ELP.MATRICULA >= ' + QuotedStr(edtMatrTit.Text) + #13;
                end;
       end;

    end;

    if edtMatricula.Text <> '' then begin
       sTabela := RetornaTabela(edtMatricula.Text);
       Result := True;
       case cboMatricula.ItemIndex of
            0 : begin
                  if chkMatricula.Checked then
                      sSql := sSql +  'AND UPPER(' + sTabela + '.MATRICULA) = ' + QuotedStr(UpperCase(edtMatricula.Text)) + #13
                   else
                      sSql := sSql +  'AND ' + sTabela + '.MATRICULA = ' + QuotedStr(edtMatricula.Text) + #13;
                end;
            1 : begin
                  if chkMatricula.Checked then
                     sSql := sSql +  'AND UPPER(' + sTabela + '.MATRICULA) LIKE ''' + UpperCase(edtMatricula.Text) + '%''' + #13
                  else
                     sSql := sSql +  'AND ' + sTabela + '.MATRICULA LIKE ''' + edtMatricula.Text + '%''' + #13;
                end;
            2 : begin
                  if chkMatricula.Checked then
                     sSql := sSql +  'AND UPPER(' + sTabela + '.MATRICULA) LIKE %''' + UpperCase(edtMatricula.Text) + '%''' + #13
                  else
                     sSql := sSql +  'AND ' + sTabela + '.MATRICULA LIKE %''' + edtMatricula.Text + '%''' + #13;
                end;
            3 : begin
                  if chkMatricula.Checked then
                     sSql := sSql +  'AND UPPER(' + sTabela + '.MATRICULA) < ' + QuotedStr(UpperCase(edtMatricula.Text)) + #13
                  else
                     sSql := sSql +  'AND ' + sTabela + '.MATRICULA < ' + QuotedStr(edtMatricula.Text) + #13;
                end;
            4 : begin
                  if chkMatricula.Checked then
                     sSql := sSql +  'AND UPPER(' + sTabela + '.MATRICULA) > ' + QuotedStr(UpperCase(edtMatricula.Text)) + #13
                  else
                      sSql := sSql +  'AND ' + sTabela + '.MATRICULA > ' + QuotedStr(edtMatricula.Text) + #13;
                end;
            5 : begin
                  if chkMatricula.Checked then
                     sSql := sSql +  'AND UPPER(' + sTabela + '.MATRICULA) <= ' + QuotedStr(UpperCase(edtMatricula.Text)) + #13
                  else
                     sSql := sSql +  'AND ' + sTabela + '.MATRICULA <= ' + QuotedStr(edtMatricula.Text) + #13;
                end;
            6 : begin
                  if chkMatricula.Checked then
                      sSql := sSql +  'AND UPPER(' + sTabela + '.MATRICULA) >= ' + QuotedStr(UpperCase(edtMatricula.Text)) + #13
                  else
                     sSql := sSql +  'AND ' + sTabela + '.MATRICULA >= ' + QuotedStr(edtMatricula.Text) + #13;
                end;
       end;

    end;


    if edtInscricaoPrev.Text <> '' then begin
       Result := True;
       case cboInscricao.ItemIndex of
            0 : begin
                  if chkInscricao.Checked then
                     sSql := sSql +  'AND UPPER(PPP.INSCRICAONUMERO) LIKE ''' + UpperCase(edtInscricaoPrev.Text) + '%''' + #13
                  else
                     sSql := sSql +  'AND PPP.INSCRICAONUMERO LIKE ''' + edtInscricaoPrev.Text + '%''' + #13;
                end;
            1 : begin
                  if chkInscricao.Checked then
                     sSql := sSql +  'AND UPPER(PPP.INSCRICAONUMERO) LIKE %''' + UpperCase(edtInscricaoPrev.Text) + '%''' + #13
                  else
                     sSql := sSql +  'AND PPP.INSCRICAONUMERO LIKE %''' + edtInscricaoPrev.Text + '%''' + #13;
                end;
            2 : begin
                  if chkInscricao.Checked then
                      sSql := sSql +  'AND UPPER(PPP.INSCRICAONUMERO) = ' + QuotedStr(UpperCase(edtInscricaoPrev.Text)) + #13
                   else
                      sSql := sSql +  'AND PPP.INSCRICAONUMERO = ' + QuotedStr(edtInscricaoPrev.Text) + #13;
                end;
            3 : begin
                  if chkInscricao.Checked then
                     sSql := sSql +  'AND UPPER(PPP.INSCRICAONUMERO) < ' + QuotedStr(UpperCase(edtInscricaoPrev.Text)) + #13
                  else
                     sSql := sSql +  'AND PPP.INSCRICAONUMERO < ' + QuotedStr(edtInscricaoPrev.Text) + #13;
                end;
            4 : begin
                  if chkInscricao.Checked then
                     sSql := sSql +  'AND UPPER(PPP.INSCRICAONUMERO) > ' + QuotedStr(UpperCase(edtInscricaoPrev.Text)) + #13
                  else
                      sSql := sSql +  'AND PPP.INSCRICAONUMERO > ' + QuotedStr(edtInscricaoPrev.Text) + #13;
                end;
            5 : begin
                  if chkInscricao.Checked then
                     sSql := sSql +  'AND UPPER(PPP.INSCRICAONUMERO) <= ' + QuotedStr(UpperCase(edtInscricaoPrev.Text)) + #13
                  else
                     sSql := sSql +  'AND PPP.INSCRICAONUMERO <= ' + QuotedStr(edtInscricaoPrev.Text) + #13;
                end;
            6 : begin
                  if chkInscricao.Checked then
                      sSql := sSql +  'AND UPPER(PPP.INSCRICAONUMERO) >= ' + QuotedStr(UpperCase(edtInscricaoPrev.Text)) + #13
                  else
                     sSql := sSql +  'AND PPP.INSCRICAONUMERO >= ' + QuotedStr(edtInscricaoPrev.Text) + #13;
                end;
       end;
    end;

    if edtCpf.Text <> '' then begin
       Result := True;
       case cboCPF.ItemIndex of
            0 : begin
                  if chkCPF.Checked then
                     sSql := sSql +  'AND UPPER(DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO)) LIKE ''' + UpperCase(edtCPF.Text) + '%''' + #13
                  else
                     sSql := sSql +  'AND DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO) LIKE ''' + edtCPF.Text + '%''' + #13;
                end;
            1 : begin
                  if chkCPF.Checked then
                     sSql := sSql +  'AND UPPER(DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO)) LIKE %''' + UpperCase(edtCPF.Text) + '%''' + #13
                  else
                     sSql := sSql +  'AND DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO) LIKE %''' + edtCPF.Text + '%''' + #13;
                end;
            2 : begin
                  if chkCPF.Checked then
                      sSql := sSql +  'AND UPPER(DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO)) = ' + QuotedStr(UpperCase(edtCPF.Text)) + #13
                   else
                      sSql := sSql +  'AND DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO) = ' + QuotedStr(edtCPF.Text) + #13;
                end;
            3 : begin
                  if chkCPF.Checked then
                     sSql := sSql +  'AND UPPER(DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO)) < ' + QuotedStr(UpperCase(edtCPF.Text)) + #13
                  else
                     sSql := sSql +  'AND DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO) < ' + QuotedStr(edtCPF.Text) + #13;
                end;
            4 : begin
                  if chkCPF.Checked then
                     sSql := sSql +  'AND UPPER(DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO)) > ' + QuotedStr(UpperCase(edtCPF.Text)) + #13
                  else
                      sSql := sSql +  'AND DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO) > ' + QuotedStr(edtCPF.Text) + #13;
                end;
            5 : begin
                  if chkCPF.Checked then
                     sSql := sSql +  'AND UPPER(DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO)) <= ' + QuotedStr(UpperCase(edtCPF.Text)) + #13
                  else
                     sSql := sSql +  'AND DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO) <= ' + QuotedStr(edtCPF.Text) + #13;
                end;
            6 : begin
                  if chkCPF.Checked then
                      sSql := sSql +  'AND UPPER(DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO)) >= ' + QuotedStr(UpperCase(edtCPF.Text)) + #13
                  else
                     sSql := sSql +  'AND DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO) >= ' + QuotedStr(edtCPF.Text) + #13;
                end;
       end;
    end;

    if edtNomeTit.Text <> '' then begin
       Result := True;
       case cboNomeTitular.ItemIndex of
            0 : begin
                  if chkNomeTit.Checked then
                     sSql := sSql +  'AND UPPER(PEP.NOME) LIKE ''' + UpperCase(edtNomeTit.Text) + '%''' + #13
                  else
                     sSql := sSql +  'AND PEP.NOME LIKE ''' + edtNomeTit.Text + '%''' + #13;
                end;
            1 : begin
                  if chkNomeTit.Checked then
                     sSql := sSql +  'AND UPPER(PEP.NOME) LIKE %''' + UpperCase(edtNomeTit.Text) + '%''' + #13
                  else
                     sSql := sSql +  'AND PEP.NOME LIKE %''' + edtNomeTit.Text + '%''' + #13;
                end;
            2 : begin
                  if chkNomeTit.Checked then
                      sSql := sSql +  'AND UPPER(PEP.NOME) = ' + QuotedStr(UpperCase(edtNomeTit.Text)) + #13
                   else
                      sSql := sSql +  'AND PEP.NOME = ' + QuotedStr(edtNomeTit.Text) + #13;
                end;
            3 : begin
                  if chkNomeTit.Checked then
                     sSql := sSql +  'AND UPPER(PEP.NOME) < ' + QuotedStr(UpperCase(edtNomeTit.Text)) + #13
                  else
                     sSql := sSql +  'AND PEP.NOME < ' + QuotedStr(edtNomeTit.Text) + #13;
                end;
            4 : begin
                  if chkNomeTit.Checked then
                     sSql := sSql +  'AND UPPER(PEP.NOME) > ' + QuotedStr(UpperCase(edtNomeTit.Text)) + #13
                  else
                      sSql := sSql +  'AND PEP.NOME > ' + QuotedStr(edtNomeTit.Text) + #13;
                end;
            5 : begin
                  if chkNomeTit.Checked then
                     sSql := sSql +  'AND UPPER(PEP.NOME) <= ' + QuotedStr(UpperCase(edtNomeTit.Text)) + #13
                  else
                     sSql := sSql +  'AND PEP.NOME <= ' + QuotedStr(edtNomeTit.Text) + #13;
                end;
            6 : begin
                  if chkNomeTit.Checked then
                      sSql := sSql +  'AND UPPER(PEP.NOME) >= ' + QuotedStr(UpperCase(edtNomeTit.Text)) + #13
                  else
                     sSql := sSql +  'AND PEP.NOME >= ' + QuotedStr(edtNomeTit.Text) + #13;
                end;
       end;

    end;

    if edtCPFTit.Text <> '' then begin
       Result := True;
       case cboCPFTIT.ItemIndex of
            0 : begin
                  if chkCPFTit.Checked then
                     sSql := sSql +  'AND UPPER(PEP.NUMDOCUMENTO) LIKE ''' + UpperCase(edtCPFTit.Text) + '%''' + #13
                  else
                     sSql := sSql +  'AND PEP.NUMDOCUMENTO LIKE ''' + edtCPFTit.Text + '%''' + #13;
                end;
            1 : begin
                  if chkCPFTit.Checked then
                     sSql := sSql +  'AND UPPER(PEP.NUMDOCUMENTO) LIKE %''' + UpperCase(edtCPFTit.Text) + '%''' + #13
                  else
                     sSql := sSql +  'AND PEP.NUMDOCUMENTO LIKE %''' + edtCPFTit.Text + '%''' + #13;
                end;
            2 : begin
                  if chkCPFTit.Checked then
                      sSql := sSql +  'AND UPPER(PEP.NUMDOCUMENTO) = ' + QuotedStr(UpperCase(edtCPFTit.Text)) + #13
                   else
                      sSql := sSql +  'AND PEP.NUMDOCUMENTO = ' + QuotedStr(edtCPFTit.Text) + #13;
                end;
            3 : begin
                  if chkCPFTit.Checked then
                     sSql := sSql +  'AND UPPER(PEP.NUMDOCUMENTO) < ' + QuotedStr(UpperCase(edtCPFTit.Text)) + #13
                  else
                     sSql := sSql +  'AND PEP.NUMDOCUMENTO < ' + QuotedStr(edtCPFTit.Text) + #13;
                end;
            4 : begin
                  if chkCPFTit.Checked then
                     sSql := sSql +  'AND UPPER(PEP.NUMDOCUMENTO) > ' + QuotedStr(UpperCase(edtCPFTit.Text)) + #13
                  else
                      sSql := sSql +  'AND PEP.NUMDOCUMENTO > ' + QuotedStr(edtCPFTit.Text) + #13;
                end;
            5 : begin
                  if chkCPFTit.Checked then
                     sSql := sSql +  'AND UPPER(PEP.NUMDOCUMENTO) <= ' + QuotedStr(UpperCase(edtCPFTit.Text)) + #13
                  else
                     sSql := sSql +  'AND PEP.NUMDOCUMENTO <= ' + QuotedStr(edtCPFTit.Text) + #13;
                end;
            6 : begin
                  if chkCPFTit.Checked then
                      sSql := sSql +  'AND UPPER(PEP.NUMDOCUMENTO) >= ' + QuotedStr(UpperCase(edtCPFTit.Text)) + #13
                  else
                     sSql := sSql +  'AND PEP.NUMDOCUMENTO >= ' + QuotedStr(edtCPFTit.Text) + #13;
                end;
       end;

    end;

    if edtSituacao.Text <> '' then begin
       Result := True;
       case cboSituacaoFund.ItemIndex of
            0 : begin
                  if chkSitFund.Checked then
                     sSql := sSql +  'AND UPPER(SIP.DESCRICAO) LIKE ''' + UpperCase(edtSituacao.Text) + '%''' + #13
                  else
                     sSql := sSql +  'AND SIP.DESCRICAO LIKE ''' + edtSituacao.Text + '%''' + #13;
                end;
            1 : begin
                  if chkSitFund.Checked then
                     sSql := sSql +  'AND UPPER(SIP.DESCRICAO) LIKE %''' + UpperCase(edtSituacao.Text) + '%''' + #13
                  else
                     sSql := sSql +  'AND SIP.DESCRICAO LIKE %''' + edtSituacao.Text + '%''' + #13;
                end;
            2 : begin
                  if chkSitFund.Checked then
                      sSql := sSql +  'AND UPPER(SIP.DESCRICAO) = ' + QuotedStr(UpperCase(edtSituacao.Text)) + #13
                   else
                      sSql := sSql +  'AND SIP.DESCRICAO = ' + QuotedStr(edtSituacao.Text) + #13;
                end;
            3 : begin
                  if chkSitFund.Checked then
                     sSql := sSql +  'AND UPPER(SIP.DESCRICAO) < ' + QuotedStr(UpperCase(edtSituacao.Text)) + #13
                  else
                     sSql := sSql +  'AND SIP.DESCRICAO < ' + QuotedStr(edtSituacao.Text) + #13;
                end;
            4 : begin
                  if chkSitFund.Checked then
                     sSql := sSql +  'AND UPPER(SIP.DESCRICAO) > ' + QuotedStr(UpperCase(edtSituacao.Text)) + #13
                  else
                      sSql := sSql +  'AND SIP.DESCRICAO > ' + QuotedStr(edtSituacao.Text) + #13;
                end;
            5 : begin
                  if chkSitFund.Checked then
                     sSql := sSql +  'AND UPPER(SIP.DESCRICAO) <= ' + QuotedStr(UpperCase(edtSituacao.Text)) + #13
                  else
                     sSql := sSql +  'AND SIP.DESCRICAO <= ' + QuotedStr(edtSituacao.Text) + #13;
                end;
            6 : begin
                  if chkSitFund.Checked then
                      sSql := sSql +  'AND UPPER(SIP.DESCRICAO) >= ' + QuotedStr(UpperCase(edtSituacao.Text)) + #13
                  else
                     sSql := sSql +  'AND SIP.DESCRICAO >= ' + QuotedStr(edtSituacao.Text) + #13;
                end;
       end;

    end;

    if edtSitPlano.Text <> '' then begin
       Result := True;
       case cboSituacaoPlano.ItemIndex of
            0 : begin
                  if chkSitPlano.Checked then
                     sSql := sSql +  'AND UPPER(SPP.DESCRICAO) LIKE ''' + UpperCase(edtSituacao.Text) + '%''' + #13
                  else
                     sSql := sSql +  'AND SPP.DESCRICAO LIKE ''' + edtSituacao.Text + '%''' + #13;
                end;
            1 : begin
                  if chkSitPlano.Checked then
                     sSql := sSql +  'AND UPPER(SPP.DESCRICAO) LIKE %''' + UpperCase(edtSituacao.Text) + '%''' + #13
                  else
                     sSql := sSql +  'AND SPP.DESCRICAO LIKE %''' + edtSituacao.Text + '%''' + #13;
                end;
            2 : begin
                  if chkSitPlano.Checked then
                      sSql := sSql +  'AND UPPER(SPP.DESCRICAO) = ' + QuotedStr(UpperCase(edtSituacao.Text)) + #13
                   else
                      sSql := sSql +  'AND SPP.DESCRICAO = ' + QuotedStr(edtSituacao.Text) + #13;
                end;
            3 : begin
                  if chkSitPlano.Checked then
                     sSql := sSql +  'AND UPPER(SPP.DESCRICAO) < ' + QuotedStr(UpperCase(edtSituacao.Text)) + #13
                  else
                     sSql := sSql +  'AND SPP.DESCRICAO < ' + QuotedStr(edtSituacao.Text) + #13;
                end;
            4 : begin
                  if chkSitPlano.Checked then
                     sSql := sSql +  'AND UPPER(SPP.DESCRICAO) > ' + QuotedStr(UpperCase(edtSituacao.Text)) + #13
                  else
                      sSql := sSql +  'AND SPP.DESCRICAO > ' + QuotedStr(edtSituacao.Text) + #13;
                end;
            5 : begin
                  if chkSitPlano.Checked then
                     sSql := sSql +  'AND UPPER(SPP.DESCRICAO) <= ' + QuotedStr(UpperCase(edtSituacao.Text)) + #13
                  else
                     sSql := sSql +  'AND SPP.DESCRICAO <= ' + QuotedStr(edtSituacao.Text) + #13;
                end;
            6 : begin
                  if chkSitPlano.Checked then
                      sSql := sSql +  'AND UPPER(SPP.DESCRICAO) >= ' + QuotedStr(UpperCase(edtSituacao.Text)) + #13
                  else
                     sSql := sSql +  'AND SPP.DESCRICAO >= ' + QuotedStr(edtSituacao.Text) + #13;
                end;
       end;
    end;

    if edtPatro.Text <> '' then begin
       Result := True;
       case cboPatro.ItemIndex of
            0 : begin
                  if chkPatro.Checked then
                     sSql := sSql +  'AND UPPER(PPA.NOME) LIKE ''' + UpperCase(edtPatro.Text) + '%''' + #13
                  else
                     sSql := sSql +  'AND PPA.NOME LIKE ''' + edtPatro.Text + '%''' + #13;
                end;
            1 : begin
                  if chkPatro.Checked then
                     sSql := sSql +  'AND UPPER(PPA.NOME) LIKE %''' + UpperCase(edtPatro.Text) + '%''' + #13
                  else
                     sSql := sSql +  'AND PPA.NOME LIKE %''' + edtPatro.Text + '%''' + #13;
                end;
            2 : begin
                  if chkPatro.Checked then
                      sSql := sSql +  'AND UPPER(PPA.NOME) = ' + QuotedStr(UpperCase(edtPatro.Text)) + #13
                   else
                      sSql := sSql +  'AND PPA.NOME = ' + QuotedStr(edtPatro.Text) + #13;
                end;
            3 : begin
                  if chkPatro.Checked then
                     sSql := sSql +  'AND UPPER(PPA.NOME) < ' + QuotedStr(UpperCase(edtPatro.Text)) + #13
                  else
                     sSql := sSql +  'AND PPA.NOME < ' + QuotedStr(edtPatro.Text) + #13;
                end;
            4 : begin
                  if chkPatro.Checked then
                     sSql := sSql +  'AND UPPER(PPA.NOME) > ' + QuotedStr(UpperCase(edtPatro.Text)) + #13
                  else
                      sSql := sSql +  'AND PPA.NOME > ' + QuotedStr(edtPatro.Text) + #13;
                end;
            5 : begin
                  if chkPatro.Checked then
                     sSql := sSql +  'AND UPPER(PPA.NOME) <= ' + QuotedStr(UpperCase(edtPatro.Text)) + #13
                  else
                     sSql := sSql +  'AND PPA.NOME <= ' + QuotedStr(edtPatro.Text) + #13;
                end;
            6 : begin
                  if chkPatro.Checked then
                      sSql := sSql +  'AND UPPER(PPA.NOME) >= ' + QuotedStr(UpperCase(edtPatro.Text)) + #13
                  else
                     sSql := sSql +  'AND PPA.NOME >= ' + QuotedStr(edtPatro.Text) + #13;
                end;
       end;

    end;

    if edtPlano.Text <> '' then begin
       Result := True;
       case cboPlano.ItemIndex of
            0 : begin
                  if chkPlano.Checked then
                     sSql := sSql +  'AND UPPER(PLP.NOME) LIKE ''' + UpperCase(edtPlano.Text) + '%''' + #13
                  else
                     sSql := sSql +  'AND PLP.NOME LIKE ''' + edtPlano.Text + '%''' + #13;
                end;
            1 : begin
                  if chkPlano.Checked then
                     sSql := sSql +  'AND UPPER(PLP.NOME) LIKE %''' + UpperCase(edtPlano.Text) + '%''' + #13
                  else
                     sSql := sSql +  'AND PLP.NOME LIKE %''' + edtPlano.Text + '%''' + #13;
                end;
            2 : begin
                  if chkPlano.Checked then
                      sSql := sSql +  'AND UPPER(PLP.NOME) = ' + QuotedStr(UpperCase(edtPlano.Text)) + #13
                   else
                      sSql := sSql +  'AND PLP.NOME = ' + QuotedStr(edtPlano.Text) + #13;
                end;
            3 : begin
                  if chkPlano.Checked then
                     sSql := sSql +  'AND UPPER(PLP.NOME) < ' + QuotedStr(UpperCase(edtPlano.Text)) + #13
                  else
                     sSql := sSql +  'AND PLP.NOME < ' + QuotedStr(edtPlano.Text) + #13;
                end;
            4 : begin
                  if chkPlano.Checked then
                     sSql := sSql +  'AND UPPER(PLP.NOME) > ' + QuotedStr(UpperCase(edtPlano.Text)) + #13
                  else
                      sSql := sSql +  'AND PLP.NOME > ' + QuotedStr(edtPlano.Text) + #13;
                end;
            5 : begin
                  if chkPlano.Checked then
                     sSql := sSql +  'AND UPPER(PLP.NOME) <= ' + QuotedStr(UpperCase(edtPlano.Text)) + #13
                  else
                     sSql := sSql +  'AND PLP.NOME <= ' + QuotedStr(edtPlano.Text) + #13;
                end;
            6 : begin
                  if chkPlano.Checked then
                      sSql := sSql +  'AND UPPER(PLP.NOME) >= ' + QuotedStr(UpperCase(edtPlano.Text)) + #13
                  else
                     sSql := sSql +  'AND PLP.NOME >= ' + QuotedStr(edtPlano.Text) + #13;
                end;
       end;

    end;

end;



procedure TfrmExecBuscaSolicitante.PageControlChange(Sender: TObject);
begin
  inherited;
   bbtnConfirmar.Visible := PageControl.ActivePageIndex = 0;
   btnOK.Visible         := PageControl.ActivePageIndex = 1;
   Application.ProcessMessages;

end;



procedure TfrmExecBuscaSolicitante.btnOKClick(Sender: TObject);
var i : Integer;
begin

   for i := 0 to 16 do ValoresChave[i] := '';

   if FRetornouValor  then begin
      ValoresChave[0]  := qryResultadoC12.AsString;           // IDBEnef
      ValoresChave[1]  := qryResultadoC13.AsString;           // IDPEssoa
      ValoresChave[2]  := qryResultadoNOME.AsString;          // Nome mutuário
      ValoresChave[3]  := qryResultadoCPF.AsString;           // CPF
      ValoresChave[4]  := qryResultadoMATRICULA.AsString;     // Matricula
      ValoresChave[5]  := qryResultadoNOME_TIT.AsString;      // Nome Titular
      ValoresChave[6]  := qryResultadoCPF_TIT.AsString;       // CPF Titular
      ValoresChave[7]  := qryResultadoMATRICULA_TIT.AsString; // Matricula Titular
      ValoresChave[8]  := qryResultadoC20.AsString;           // Inscricao Prev
      ValoresChave[9]  := qryResultadoC21.AsString;           // Nome Patrocinadora
      ValoresChave[10] := qryResultadoC22.AsString;           // Plano Prev
      ValoresChave[11] := qryResultadoC23.AsString;           // IDPatro
      ValoresChave[12] := qryResultadoC24.AsString;           // IDPlanoPrev
//      ValoresChave[13] := qryResultadoTIPO.AsString;          // Situação (Tipo)
      ValoresChave[13] := qryResultadoSIT_PART.AsString;      // Situação Participante
      ValoresChave[14] := qryResultadoC26.AsString;           // IDSitPart
      ValoresChave[15] := '';                                 // Não utilizado
      ValoresChave[16] := qryResultadoC28.AsString;           // FlgInterno
   end;

   FRetornouValor := True;
   frmExecBuscaSolicitante.Close;
//   bbtnSair.Click;
end;



procedure TfrmExecBuscaSolicitante.wwDBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
   if Key = VK_RETURN then
      btnOKClick(Self);
end;



procedure TfrmExecBuscaSolicitante.bbtnSairClick(Sender: TObject);
begin
   FRetornouValor := False;
   QryResultado.Close;
   Close;
end;



procedure TfrmExecBuscaSolicitante.FormShow(Sender: TObject);
begin
  inherited;
  cboNome.ItemIndex          := 0;
  cboMatrTit.ItemIndex       := 0;
  cboMatricula.ItemIndex     := 0;
  cboInscricao.ItemIndex     := 0;
  cboCPF.ItemIndex           := 0;
  cboNomeTitular.ItemIndex   := 0;
  cboCPFTIT.ItemIndex        := 0;
  cboSituacaoFund.ItemIndex  := 0;
  cboSituacaoPlano.ItemIndex := 0;
  cboPatro.ItemIndex         := 0;
  cboPlano.ItemIndex         := 0;
end;



function TfrmExecBuscaSolicitante.RetornaTabela(sMatricula : String) : String;
begin
   Result := 'ELP';

   LimpaParametros(qrySituacaoParticipante);
   qrySituacaoParticipante.ParamByName('PMATRICULA').AsString := sMatricula;
   qrySituacaoParticipante.Open;

   if (qrySituacaoParticipante.IsEmpty) or (qrySituacaoParticipanteFLGINTERNO.IsNull) then Result := 'DEP';
end;



end.
