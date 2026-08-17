//****************************************************************************//
// SISTEMA : REGRA (REGRAS DE NEGÓCIO)                                        //
// Alterações:                                                                //                                                             //
//    16/11/00                                                                //
//    Alexandre Ramos.                                                        //
//    Controle de Transação na Exclusão de Regra                              //
//****************************************************************************//
{------------------------------------------------------------------------------}
{  Alterações:
-------------------------------------------------------------------------------  }
//--------------------------------------------------------------------------------
//  Autor     : André Oliveira
//  Pendencia : SOL 183347 Kintana 1712386
//  Descrição : Aumentar limite de 200 passos das regras para 400
//  Data      : 02/07/2012
//------------------------------------------------------------------------------
// Autor(a)    :  BRUNO AZEVEDO
// Data        :  27/04/2012
// Pendência   :  SOL 179170 KINTANA 1648138
// Descrição   :  Ajuste no controle dos botões.
//------------------------------------------------------------------------------
// Autor(a)    :  BRUNO AZEVEDO
// Data        :  27/04/2012
// Pendência   :  SOL 179172 KINTANA 1648139
// Descrição   :  Ajuste ao salvar a descrição da regra.
//------------------------------------------------------------------------------
// Autor(a)    :  BRUNO AZEVEDO
// Data        :  27/04/2012
// Pendência   :  SOL 179171 KINTANA 1648033
// Descrição   :  Ajuste no controle do operando 2.
//------------------------------------------------------------------------------
// Autor(a)    :  BRUNO AZEVEDO
// Data        :  27/04/2012
// Pendência   :  SOL 179169 KINTANA 1648129
// Descrição   :  Ajuste no controle dos botões.
//------------------------------------------------------------------------------
//  Autor  : Vinicius Ferreira
//  Data   : 12/01/2012
//  Rotina    : TipodeCampo
//  Pendencia : SOL 170160 KINTANA 1520628
//              Erro ao retornar a DESCRICAODOCAMPO quando nome da variavel for igual ao nome do campo

unit fCadRegra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls,
  wwriched, Mask, wwdbedit, wwdblook, DBCtrls, Wwdotdot, Wwdbcomb, URegra,
  CmEventosCadastro, ImgList, uCmTypes;

type
  TfrmCadRegra = class(TfrmCadMestreDetalheCS)
    QryDet: TwwQuery;
    updDet: TUpdateSQL;
    QryTipoRegra: TwwQuery;
    Toolbar972: TToolbar97;
    sbtnCopiar: TToolbarButton97;
    SbtnRenum: TSpeedButton;
    QryAux: TwwQuery;
    msGeral: TMontaSelect;
    lstId: TListBox;
    lstT: TListBox;
    lstF: TListBox;
    panAtribVal: TPanel;
    lblalgoritmo: TLabel;
    panCompara: TPanel;
    panParar: TPanel;
    panMensagem: TPanel;
    panAtribRegra: TPanel;
    panImput: TPanel;
    panGoto: TPanel;
    panDemonst: TPanel;
    Label13: TLabel;
    edvariavel: TEdit;
    Label14: TLabel;
    sbtnBscVariavel: TSpeedButton;
    Label16: TLabel;
    edregra: TEdit;
    Label15: TLabel;
    sbtnBscRegra: TSpeedButton;
    Label32: TLabel;
    edVar1: TEdit;
    Label33: TLabel;
    sbtnBscVariavelVar: TSpeedButton;
    Label35: TLabel;
    edValor5: TEdit;
    Label34: TLabel;
    sbtnBscCampoFormula: TSpeedButton;
    chkvalor: TCheckBox;
    Label17: TLabel;
    chkerro: TCheckBox;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    SbtnMensagem: TSpeedButton;
    Panel3: TPanel;
    Label20: TLabel;
    Label21: TLabel;
    lblComp: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    sbtnEd1: TSpeedButton;
    sbtnEd2: TSpeedButton;
    edComp1: TEdit;
    edComp2: TEdit;
    cmbCorrelacao: TComboBox;
    Label18: TLabel;
    bbtnpassos: TBitBtn;
    nbkPassos: TNotebook;
    Label1: TLabel;
    dedIdRegra: TwwDBEdit;
    Label2: TLabel;
    dedNome: TwwDBEdit;
    Label3: TLabel;
    dedDescricao: TDBMemo;
    Label4: TLabel;
    wwDBGrid1: TwwDBGrid;
    Panel2: TPanel;
    bbtnfechar: TBitBtn;
    Label38: TLabel;
    Label39: TLabel;
    Label30: TLabel;
    edVarInput: TEdit;
    Label27: TLabel;
    SbtnImput: TSpeedButton;
    Label28: TLabel;
    Label19: TLabel;
    Label25: TLabel;
    edValorDetalhe: TEdit;
    Label40: TLabel;
    sbtnFormulasValoresDemonst: TSpeedButton;
    cmbdecimais: TComboBox;
    cmbformatOld: TComboBox;
    Label41: TLabel;
    lbldec: TLabel;
    edvalormsg: TEdit;
    edtPassoVar: TEdit;
    edtPassoCompara: TEdit;
    edtParar: TEdit;
    edtPassoMens: TEdit;
    edtPassoRegra: TEdit;
    edtPassoInput: TEdit;
    edtPassoGoto: TEdit;
    edtPassoDemonst: TEdit;
    edtValorDemonst: TEdit;
    edtValor: TEdit;
    EdtTextoImputar: TEdit;
    dedCmbGotoPasso: TComboBox;
    edtTrue: TComboBox;
    edtFalse: TComboBox;
    dedTipoRegra: TwwDBLookupCombo;
    Splitter1: TSplitter;
    sbtnGeral: TToolbarButton97;
    QryParam: TwwQuery;
    dbrgpPublicada: TDBRadioGroup;
    SpeedButton2: TSpeedButton;
    Label5: TLabel;
    SbtnListaValores: TSpeedButton;
    QryPermissao: TwwQuery;
    QryDetIDREGRA: TFloatField;
    QryDetIDALGORITMODAREG: TFloatField;
    QryDetIDCAMPO: TStringField;
    QryDetFORMULA1: TFloatField;
    QryDetCORRELACAO: TStringField;
    QryDetFORMULA2: TFloatField;
    QryDetIDCAMPO2: TStringField;
    QryDetVALOR: TStringField;
    QryDetTIPOALGORITMO: TFloatField;
    QryDetDESCRICAOALGORIT: TStringField;
    QryDetALGORSUBSEQTRUE: TFloatField;
    QryDetALGORSUBSEQFALSE: TFloatField;
    QryDetTIPOCAMPO1: TFloatField;
    QryDetTIPOCAMPO2: TFloatField;
    QryDetFORMATACAO: TFloatField;
    chkbVlrConst: TCheckBox;
    CmbFormat: TwwDBComboBox;
    ChBxValConst: TCheckBox;
    QryDetEXPRESSAOFORMULA: TStringField;
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnCopiarClick(Sender: TObject);
    procedure SbtnRenumClick(Sender: TObject);
    function AchaPassonoList(PassoOld : String) : LongInt;
    function RefazTexto(texto, cmp1, cmp2 : String) : String;
    function TrazUltimoTestadoIdRegra : LongInt;
    procedure TrataBotoes( Valor : Boolean );
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure sbtnBscVariavelClick(Sender: TObject);
    procedure sbtnBscRegraClick(Sender: TObject);
    procedure edvariavelChange(Sender: TObject);
    procedure DesabilitaPanel;
    procedure TrataBotoesDetalhe;
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnBscCampoFormulaClick(Sender: TObject);
    procedure edVar1Change(Sender: TObject);
    procedure chkerroClick(Sender: TObject);
    procedure sbtnEd1Click(Sender: TObject);
    procedure sbtnEd2Click(Sender: TObject);
    procedure cmbCorrelacaoChange(Sender: TObject);
    procedure edComp1Change(Sender: TObject);
    procedure edComp2Exit(Sender: TObject);
    procedure edComp1Exit(Sender: TObject);
    procedure bbtnpassosClick(Sender: TObject);
    procedure bbtnfecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dedCmbGotoPassoChange(Sender: TObject);
    procedure dedIdRegraChange(Sender: TObject);
    procedure edtPassoVarChange(Sender: TObject);
    procedure edtPassoComparaChange(Sender: TObject);
    procedure edtPararChange(Sender: TObject);
    procedure edtPassoMensChange(Sender: TObject);
    procedure edtPassoRegraChange(Sender: TObject);
    procedure edtPassoInputChange(Sender: TObject);
    procedure edtPassoGotoChange(Sender: TObject);
    procedure edtPassoDemonstChange(Sender: TObject);
    procedure LimparPassos;
    procedure EditarPassos;
    procedure IniVariaveis;
    procedure GravaDadosDetalhe;
    procedure edtValorDemonstChange(Sender: TObject);
    procedure edtFalseExit(Sender: TObject);
    procedure edtTrueExit(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure EdtTextoImputarChange(Sender: TObject);
    procedure SbtnImputClick(Sender: TObject);
    procedure sbtnBscVariavelVarClick(Sender: TObject);
    procedure SbtnMensagemClick(Sender: TObject);
    procedure sbtnFormulasValoresDemonstClick(Sender: TObject);
    procedure BuscaVariavel;
    procedure dbrgpPublicadaChange(Sender: TObject);
    procedure LimpaVarNaoUsadas;
    procedure AtribuiValores;
    Function PesqId(Descricao : String; Tipo : LongInt) : String;
    procedure AtribVal2;
    procedure AtribVal1;
    procedure edValor5Change(Sender: TObject);
    function VerificaCampos : Boolean;
    procedure sbtnApagarClick(Sender: TObject);
    procedure DescricaoCompara;
    procedure AtualizaDescr;
    procedure sbtnGeralClick(Sender: TObject);
    procedure BuscaFlags;
    Function PesqCMPBD(Identificador : String) : String;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SbtnListaValoresClick(Sender: TObject);
    function AbrePermissao( Grupo, Tipo : LongInt) : Boolean;
    procedure dedTipoRegraExit(Sender: TObject);
    procedure chkbVlrConstClick(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeDetalheOpenDataSet(Sender: TObject);
    procedure CmbFormatChange(Sender: TObject);
    procedure ChBxValConstClick(Sender: TObject);
    procedure edValorDetalheExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dedNomeEnter(Sender: TObject);
  private
    { Private declarations }
    function  TrocaPontoVirgula(Value: String): String;
    function  TipodeCampo(Valor : String; var Descricao : String) : LongInt;
    procedure Sel( n : LongInt );
  public
    { Public declarations }
    sIdRegra : String;
  end;

var
  frmCadRegra: TfrmCadRegra;

  //Variavel para uso no Insert e/ou Update dos detalhes
  vTpPasso1, vTpPasso2,  vIdRegra, vPasso, vFormula2, vTipoAlgoritmo, vTrue, vFalse,
  FlgCmp, FlgVar, vForm, vFormula1 : LongInt;
  vCampoAux, vIdCampo, vIdCampo2, vCorrelacao, vValor, vDesc : String;
  vDet, vInsMst, vInserir : Boolean;
  
  TemQry, vTipoPasso, vProximoAlgor, liTipoPasso : LongInt;


implementation

uses
    fAguarde, uMensErro, uDataBase, FTipoPasso, FTelaAut, uGlobal,
    dBaseDados, fConsulta, fcampospararegra, fListaValores, uSistema,
  dRelDetalhes;

{$R *.DFM}

procedure TfrmCadRegra.sbtnProcurarClick(Sender: TObject);
var
   vIdOld : LongInt;
begin
  MontaSelect.Executar;
  Refresh;
  if MontaSelect.RetornouValor then begin
     try
        StrtoInt(MontaSelect.ValoresChave[1]);
     except
        MsgDlg('O usuário ('+Sistema.NomeUsuario+') não está autorizado a utilizar esta operação.','Erro',mtError,[mbOk,mbHelp],0);
        sbtnProcurar.Down := False;
        Exit;
     end;

     if AbrePermissao(StrtoInt(MontaSelect.ValoresChave[1]),
                      StrtoInt(MontaSelect.ValoresChave[2]) ) then begin
        vIdOld := Qry.Fieldbyname('IDREGRA').AsInteger;
        vIdRegra := StrToInt(MontaSelect.ValoresChave[0]);
        Qrydet.DisableControls;
        Sel( vIdRegra );
        if (QryPermissao.FieldByName('FLGPROCURAR').AsInteger = 0) or (QryPermissao.IsEmpty) then begin
           MsgDlg('O usuário ('+Sistema.NomeUsuario+') não está autorizado a utilizar esta operação.','Erro',mtError,[mbOk,mbHelp],0);
           sbtnProcurar.Down := False;
           Sel( vIdOld );
        end;
        Qrydet.EnableControls;
        TrataBotoes( True );
        vDet := False;
     end;
  end;
  sbtnProcurar.Down := False;
end;

procedure TfrmCadRegra.sbtnCopiarClick(Sender: TObject);
var
   vAux, vSql, vUlt, sSQL : String;
   vTam : LongInt;
begin
  inherited;
  if (Qry.IsEmpty) then begin
     MsgDlg('Não existe Regra para ser copiada.','Erro',mtConfirmation,[mbOk,mbHelp],0);
     sbtnCopiar.Down := False;
     Exit;
  end;

  if (Qry.State in [dsEdit, dsInsert]) or (QryDet.State in [dsEdit, dsInsert]) then begin
     MsgDlg('Para copiar esta Regra confirme ou cancele a operação.','Erro',mtConfirmation,[mbOk,mbHelp],0);
     sbtnCopiar.Down := False;
     Exit;
  end;

  if MsgDlg('Deseja copiar esta Regra?','ATENÇÃO',mtConfirmation,[mbyes,mbno],0)=mrNo then
     Exit;

  vUlt := InttoStr(LeUltRegistro(nil,'REGRA'));

  vTam := Qry.FieldbyName('NOMEREGRA').Size;
  vAux := 'Cópia de '+Qry.FieldbyName('NOMEREGRA').AsString;
  if Length(vAux) > vTam then
     vAux := Copy(vAux,1,vTam);


  frmAguarde.Pos := 0;
  frmAguarde.Min := 0;
  frmAguarde.Max := QryDet.RecordCount + 1;


  frmAguarde.Mostra('Copiando Regra ...');
  frmAguarde.Refresh;

  with QryAux do begin
       Close;
       SQL.Clear;
       { Alteração Db2 }
       sSQL := 'INSERT INTO REGRA  (IDREGRA, NOMEREGRA, IDTIPOREGRA, DESCRICAOREGRA, PUBLICADA) '+
               'VALUES ('+vUlt+','''+vAux+''','+
               Qry.FieldbyName('IDTIPOREGRA').AsString+','''+
               Qry.FieldbyName('DESCRICAOREGRA').AsString+''', 0)';

       SQL.Add(sSQL);

       ExecSql;
  end;
  frmAguarde.Pos := frmAguarde.Pos + 1;

  QryDet.First;
  while not QryDet.Eof do begin
        with QryAux do begin
             Close;
             Sql.Clear;
             vSql := 'INSERT INTO ALGREGRA '+
                     '(IDREGRA, IDALGORITMODAREG, IDCAMPO, FORMULA1, CORRELACAO,'+
                     'FORMULA2, IDCAMPO2, VALOR, TIPOALGORITMO, DESCRICAOALGORIT,'+
                     'ALGORSUBSEQTRUE, ALGORSUBSEQFALSE, TIPOCAMPO1, TIPOCAMPO2, FORMATACAO)'+
                     'VALUES ('+vUlt+','+QryDet.Fieldbyname('IDALGORITMODAREG').AsString+','''+
                     QryDet.Fieldbyname('IDCAMPO').AsString+''',';

             if QryDet.Fieldbyname('FORMULA1').AsString = '' then vSql := vSql + 'NULL,'''
                else vSql := vSql + QryDet.Fieldbyname('FORMULA1').AsString+',''';

             vSql := vSql + QryDet.Fieldbyname('CORRELACAO').AsString+''',';

             if QryDet.Fieldbyname('FORMULA2').AsString = '' then vSql := vSql + 'NULL,'''
                else vSql := vSql + QryDet.Fieldbyname('FORMULA2').AsString+',''';

             vSql := vSql +
                     QryDet.Fieldbyname('IDCAMPO2').AsString+''','''+
                     QryDet.Fieldbyname('VALOR').AsString+''','+
                     QryDet.Fieldbyname('TIPOALGORITMO').AsString+','''+
                     QryDet.Fieldbyname('DESCRICAOALGORIT').AsString+''',';

             if QryDet.Fieldbyname('ALGORSUBSEQTRUE').AsString = '' then vSql := vSql + 'NULL,'
                else vSql := vSql + QryDet.Fieldbyname('ALGORSUBSEQTRUE').AsString+',';

             if QryDet.Fieldbyname('ALGORSUBSEQFALSE').AsString = '' then vSql := vSql + 'NULL,'
                else vSql := vSql + QryDet.Fieldbyname('ALGORSUBSEQFALSE').AsString+',';

             vSql := vSql +
                     QryDet.Fieldbyname('TIPOCAMPO1').AsString+','+
                     QryDet.Fieldbyname('TIPOCAMPO2').AsString+',';
             if QryDet.Fieldbyname('FORMATACAO').AsString = '' then vSql := vSql + 'NULL)'
                else vSql := vSql + QryDet.Fieldbyname('FORMATACAO').AsString+')';
             Sql.Add(vSql);
             ExecSql;
        end;
        QryDet.Next;
        frmAguarde.Pos := frmAguarde.Pos + 1;
  end;
  frmAguarde.Apaga;
  sbtnCopiar.Down := False;
end;

procedure TfrmCadRegra.SbtnRenumClick(Sender: TObject);
var
    vAux1, vAux2, vAux3, vTipo : LongInt;
    vNew, vDesc : String;
begin
  inherited;
  if qry.FieldByName('Publicada').AsString = '1' then
     MsgDlg('Esta Regra está publicada. Não pode ser alterada.','Atenção',mtError,[mbOk,mbHelp],0)
  else begin
      if MsgDlg('Deseja alterar os passos desta Regra?','Atenção',mtConfirmation, [mbyes,mbno,mbHelp],0)=mryes then begin
        frmAguarde.Mostra('Aguarde, alterando passos ...');
        frmAguarde.Refresh;

        QryDet.DisableControls;

        LstId.Items.Clear;
        LstT.Items.Clear;
        LstF.Items.Clear;

        frmAguarde.Min := 0;
        frmAguarde.Pos := 0;

        frmAguarde.Max := QryDet.RecordCount * 3;
        frmAguarde.Refresh;

        //Armazenar os Dados nos Lists
        QryDet.First;
        while not QryDet.eof do begin
            frmAguarde.Pos := frmAguarde.Pos + 1;
            vTipo := QryDet.FieldbyName('TIPOALGORITMO').AsInteger;
            Case vTipo of
                 3..8,15 :
                        begin
                             LstT.Items.Add(QryDet.FieldbyName('ALGORSUBSEQTRUE').AsString);
                             LstF.Items.Add(QryDet.FieldbyName('ALGORSUBSEQFALSE').AsString);
                             LstID.Items.Add(QryDet.FieldbyName('IDALGORITMODAREG').AsString);
                        end;
                 else
                        begin
                             LstT.Items.Add(QryDet.FieldbyName('ALGORSUBSEQTRUE').AsString);
                             LstF.Items.Add(QryDet.FieldbyName('ALGORSUBSEQFALSE').AsString);
                             LstID.Items.Add(QryDet.FieldbyName('IDALGORITMODAREG').AsString);
                        end;
            end;
            QryDet.Next;
        end;

        //Fazendo a alteração a partir dos lists
        QryDet.First;
        while not QryDet.Eof do begin
              frmAguarde.Pos := frmAguarde.Pos + 1;
              vAux1 := AchaPassonoList(QryDet.FieldbyName('IDALGORITMODAREG').AsString);
              vAux2 := AchaPassonoList(QryDet.FieldbyName('ALGORSUBSEQTRUE').AsString);
              vAux3 := AchaPassonoList(QryDet.FieldbyName('ALGORSUBSEQFALSE').AsString);

              vDesc := QryDet.FieldbyName('DESCRICAOALGORIT').AsString;
              vNew := vDesc+' ';
              if vAux2 > 0 then
                vNew := RefazTexto(vDesc, QryDet.FieldbyName('ALGORSUBSEQTRUE').AsString, InttoStr(vAux2));
              if vAux3 > 0 then
                vNew := RefazTexto(vNew, QryDet.FieldbyName('ALGORSUBSEQFALSE').AsString, InttoStr(vAux3));

              QryDet.Edit;
              if vAux2 > 0 then QryDet.FieldbyName('ALGORSUBSEQTRUE').AsFloat := vAux2;

              if vAux3 > 0 then QryDet.FieldbyName('ALGORSUBSEQFALSE').AsFloat := vAux3;
                
              QryDet.FieldbyName('IDALGORITMODAREG').AsFloat := vAux1;
              QryDet.FieldbyName('DESCRICAOALGORIT').AsString := vNew;
              QryDet.Post;
              QryDet.ApplyUpdates;
              QryDet.CommitUpdates;
              QryDet.Next;
        end;

        //Fazendo a multiplicação
        QryDet.CommitUpdates;
        QryDet.Last;
        while not QryDet.Bof do begin
             frmAguarde.Pos := frmAguarde.Pos + 1;
             vNew := QryDet.FieldbyName('DESCRICAOALGORIT').AsString;
             if QryDet.FieldbyName('ALGORSUBSEQTRUE').AsString <> '' then
                vNew := RefazTexto(vNew, QryDet.FieldbyName('ALGORSUBSEQTRUE').AsString,
                                    InttoStr(QryDet.FieldbyName('ALGORSUBSEQTRUE').AsInteger * 10));
             if QryDet.FieldbyName('ALGORSUBSEQFALSE').AsString <> '' then
                vNew := RefazTexto(vNew, QryDet.FieldbyName('ALGORSUBSEQFALSE').AsString,
                                    InttoStr(QryDet.FieldbyName('ALGORSUBSEQFALSE').AsInteger * 10));

             QryDet.Edit;
             if QryDet.FieldbyName('ALGORSUBSEQTRUE').AsString <> '' then
                QryDet.FieldbyName('ALGORSUBSEQTRUE').AsFloat := QryDet.FieldbyName('ALGORSUBSEQTRUE').AsFloat * 10;
             if QryDet.FieldbyName('ALGORSUBSEQFALSE').AsString <> '' then
                QryDet.FieldbyName('ALGORSUBSEQFALSE').AsFloat := QryDet.FieldbyName('ALGORSUBSEQFALSE').AsFloat * 10;
             QryDet.FieldbyName('IDALGORITMODAREG').AsFloat := QryDet.FieldbyName('IDALGORITMODAREG').AsFloat * 10;
             QryDet.FieldbyName('DESCRICAOALGORIT').AsString := vNew;

             QryDet.Post;
             QryDet.ApplyUpdates;
             QryDet.CommitUpdates;

             QryDet.Prior;

        end;
      end;
  end;
  QryDet.EnableControls;
  frmAguarde.Min := -1;
  frmAguarde.Apaga;
  SbtnRenum.Down := False;
  vDet := True;
end;

function TfrmCadRegra.AchaPassonoList(PassoOld : String) : LongInt;
var
   i : LongInt;
begin
     Result := 0;
     if PassoOld <> '' then begin
        For i := 0 to LstID.Items.Count - 1 do begin
            if LstId.Items[i] = PassoOld then begin
               Result := i+1;
               Break;
            end;
        end;
     end;
end;

function TfrmCadRegra.RefazTexto(texto, cmp1, cmp2 : String) : String;
var
    vTst, vDesc, vNum1, vNew, vNumNew : String;
    i, vTamDesc, vTam1 : LongInt;
begin
     vDesc := Texto+' ';
     vNum1 := ' '+cmp1+' ';
     vTam1 := Length(vNum1);
     vNew := vDesc;
     vTamDesc := Length(vNew);

     if cmp1 <> '' then begin
        for i :=1 to vTamDesc do begin
            vTst := Copy(vNew,i,vTam1);
            if (vTst = vNum1) and (vNum1 <> '') then begin
               vNumNew := cmp2;
               vNew := Copy(vNew,1,i-1)+' '+vNumNew+' '+Copy(vNew,i+Length(vNum1),Length(vNew));
            end;
        end;
     end;
     Result := vNew;
end;

function TfrmCadRegra.TrazUltimoTestadoIdRegra : LongInt;
var
   IdR : LongInt;
begin
     frmAguarde.Min := -1;
     frmAguarde.Mostra('Verificando Sequence ...');
     frmAguarde.Refresh;
     IdR := LeUltRegistro(nil, 'Regra');
     vIdRegra := IdR;
     Result := IdR;
     frmAguarde.Apaga;
end;

procedure TfrmCadRegra.TrataBotoes( Valor : Boolean );
begin
     if Valor then begin
        if not Qry.IsEmpty then begin
           sbtnAlterar.Enabled := Valor;
           sbtnApagar.Enabled := Valor;
           sbtnCopiar.Enabled := Valor;
        end else begin
           sbtnAlterar.Enabled := not Valor;
           sbtnApagar.Enabled := not Valor;
           sbtnCopiar.Enabled := not Valor;
        end;
     end else begin
        sbtnAlterar.Enabled := Valor;
        sbtnApagar.Enabled := Valor;
        sbtnCopiar.Enabled := Valor;
     end;
     sbtnInserir.Enabled := Valor;
     sbtnProcurar.Enabled := Valor;
     SbtnGeral.Enabled := Valor;

     bbtnConfirmar.Enabled := not Valor;
     bbtnCancelar.Enabled := not Valor;
     TrataBotoesDetalhe;
end;



procedure TfrmCadRegra.sbtnInserirClick(Sender: TObject);
begin
  vInsMst := True;
  TrataBotoes( False );
  SbtnRenum.Enabled := True;
  vDet := False;
  inherited;
end;

procedure TfrmCadRegra.sbtnAlterarClick(Sender: TObject);
begin
  if (QryPermissao.Fieldbyname('FLGALTERAR').AsInteger = 0) or
     (QryPermissao.IsEmpty)
  then begin
    MsgDlg('O usuário ('+Sistema.NomeUsuario+
           ') não está autorizado a utilizar esta operação.',
           'Erro',mtError,[mbOk,mbHelp],0);
    sbtnAlterar.Down := False;
    Exit;
  end;

  if Qry.FieldByName('PUBLICADA').AsInteger = 1 then begin
    MsgDlg('Esta operação não será realizada por esta Regra ser Publicada.','Erro',mtError,[mbOk,mbHelp],0);
    sbtnAlterar.Down := False;
    Exit;
  end;
  dedNome.Enabled := True;
  vInsMst := False;
  TrataBotoes( False );
  SbtnRenum.Enabled := True;
  vDet := False;

  inherited;

end;

procedure TfrmCadRegra.bbtnConfirmarClick(Sender: TObject);
var
  sTextoLog, vMens : String;
  bGravouLog : Boolean;
begin
     nbkPassos.PageIndex := 0;
     if (Qry.FieldByName('NOMEREGRA').AsString = '') then begin
        MsgDlg('Campo Nome da Regra está em branco.','Erro',mtError,[mbOk,mbHelp],0);
        dedNome.SetFocus;
        Exit;
     end;

     if (Qry.FieldByName('IDTIPOREGRA').AsString = '') then begin
        MsgDlg('Campo Tipo de Regra está em branco.','Erro',mtError,[mbOk,mbHelp],0);
        dedTipoRegra.SetFocus;
        Exit;
     end;

     if Dock974.Visible Then begin
        if MsgDlg('Confirma Operação nos passos desta Regra ?','Atenção',mtConfirmation, [mbyes,mbno],0)=mryes then
           bbtnOkDet.Click
        else
           bbtnCancelarDet.Click;
     end;

     if Dock974.Visible Then
        Exit;

     frmAguarde.Mostra('Verificando Passos ...');
     frmAguarde.Refresh;
     QryDet.DisableControls;
     QryDet.First;
     if vDet then begin
        vMens := '';
        while not QryDet.Eof do begin
              Case QryDet.FieldbyName('TIPOALGORITMO').AsInteger of
                3..8 : begin

                            Try
                              with QryAux do begin
                                   Close;
                                   Sql.Clear;
                                   Sql.Add( 'SELECT IDALGORITMODAREG FROM ALGREGRA WHERE IDREGRA = '+Qry.FieldbyName('IDREGRA').AsString+
                                            ' AND IDALGORITMODAREG = '+QryDet.FieldbyName('ALGORSUBSEQTRUE').AsString);
                                   Open;
                              end;
                              if QryAux.IsEmpty then begin
                                 vMens := vMens + 'O passo '+QryDet.FieldbyName('IDALGORITMODAREG').AsString+
                                                  ' contém um erro. Não existe o passo inserido no "Se Sim" nº '+
                                                  QryDet.FieldbyName('ALGORSUBSEQTRUE').AsString+'.';
                              end;
                              with QryAux do begin
                                   Close;
                                   Sql.Clear;
                                   Sql.Add( 'SELECT IDALGORITMODAREG FROM ALGREGRA WHERE IDREGRA = '+Qry.FieldbyName('IDREGRA').AsString+
                                            ' AND IDALGORITMODAREG = '+QryDet.FieldbyName('ALGORSUBSEQFALSE').AsString);
                                   Open;
                              end;
                              if QryAux.IsEmpty then begin
                                 if vMens <> '' then
                                    vMens := vMens + ' ';
                                 vMens := vMens + 'O passo '+QryDet.FieldbyName('IDALGORITMODAREG').AsString+
                                                  ' contém um erro. Não existe o passo inserido no "Senão" nº '+
                                                  QryDet.FieldbyName('ALGORSUBSEQFALSE').AsString+'.';
                              end;

                            Except
                              vMens := vMens + 'O passo '+QryDet.FieldbyName('IDALGORITMODAREG').AsString+
                                               ' contém um erro. Não existe o passo inserido no "Senão" nº '+
                                               QryDet.FieldbyName('ALGORSUBSEQFALSE').AsString+'.';
                            End;
                         end;
              end;
              QryDet.Next;
        end;
     end;
     QryDet.EnableControls;
     if vMens <> '' then
        MsgDlg(Trim(vMens),'Erro',mtError,[mbOk,mbHelp],0);

     frmAguarde.Min := -1;
     frmAguarde.Mostra('Gravando Regra ...');
     frmAguarde.Refresh;

     {-----------------------------------}
     { Gravar log de operação 19/12/2002 }
     If cmecadastro.Operacao = OpInserir then
       sTextoLog := 'Inclusão de Regra de Negócio '+dedIdRegra.Text
     Else If cmecadastro.Operacao = OpAlterar then
       sTextoLog := 'Manutenção da Regra de Negócio '+dedIdRegra.Text
     Else If cmecadastro.Operacao = OpApagar then
       sTextoLog := 'Exclusão da Regra de Negócio '+dedIdRegra.Text;
       
     { Grava Log da operação - 19/12/2002 }
     If Not Sistema.GravaLogOperacoes(sTextoLog) Then
       Raise Exception.Create('Não Consegui Gravar o Log');

     inherited;
     TrataBotoes( True );
     if vInsMst then begin
        bbtnConfirmar.Enabled := True;
        bbtnCancelar.Enabled := True;
     end else begin
        bbtnConfirmar.Enabled := False;
        bbtnCancelar.Enabled := False;
     end;
     frmAguarde.Apaga;

end;

procedure TfrmCadRegra.bbtnCancelarClick(Sender: TObject);
begin
     dedNome.Enabled := True;
     if vInsMst then begin
        if not Qry.IsEmpty then
           Qry.Delete;
     end;
     nbkPassos.PageIndex := 0;
     frmAguarde.Min := -1;
     frmAguarde.Mostra('Cancelando Regra ...');
     frmAguarde.Refresh;
     inherited;
     TrataBotoes( True );
     frmAguarde.Apaga;
end;

procedure TfrmCadRegra.CmeCadastroInsert(Sender: TObject);
begin
     repeat
           frmAguarde.Min := -1;
           frmAguarde.Mostra('Verificando Sequence ...');
           frmAguarde.Refresh;
           vIdRegra := LeUltRegistro(nil, 'REGRA');
           with QryAux do begin
                Close;
                Sql.Clear;
                Sql.Add('SELECT IDREGRA FROM REGRA WHERE IDREGRA = '+InttoStr(vIdRegra));
                Open;
           end;
     until QryAux.IsEmpty;
     frmAguarde.Apaga;
     Inherited;
     dedNome.SetFocus;
     Qry.FieldbyName('IDREGRA').AsInteger := vIdRegra;
     Qry.FieldbyName('PUBLICADA').AsInteger := 0;
     dbrgpPublicada.Enabled := True;
end;

procedure TfrmCadRegra.CmeCadastroEdit(Sender: TObject);
begin
  vIdRegra := Qry.FieldbyName('IDREGRA').AsInteger;
  Inherited;
  If dedIdRegra.CanFocus Then dedIdRegra.SetFocus;

end;


procedure TfrmCadRegra.bbtnCancelarDetClick(Sender: TObject);
begin
     SbtnInsDet.Down := False;
     nbkPassos.PageIndex := 0;
     frmAguarde.Min := -1;
     frmAguarde.Mostra('Cancelando Passos ...');
     frmAguarde.Refresh;

     QryDet.Close;
     QryDet.Open;

     TrataBotoesDetalhe;
     DesabilitaPanel;
     Dock974.Visible := False;
     dbgrdDet.Visible := True;
     dbgrdDet.BringToFront;

     lblalgoritmo.Visible := False;
     if (vTipoAlgoritmo = 1) or (vTipoAlgoritmo = 2) then
        chkValor.Checked := False;
     frmAguarde.Apaga;
end;

procedure TfrmCadRegra.bbtnOkDetClick(Sender: TObject);
Var
  SavePlace: TBookmark;
begin
  AtualizaDescr;

  if not VerificaCampos Then
     Exit;

  SbtnInsDet.Down := False;
  vInsMst := False;
  nbkPassos.PageIndex := 0;
  frmAguarde.Min := -1;
  frmAguarde.Mostra('Gravando Passos ...');
  frmAguarde.Refresh;
  frmAguarde.Apaga;

  // Tratamento para limitar o tamanho da descrição do algoritmo, se não limitar dá problema !!
  if Length(vDesc) > QryDet.FieldbyName('DESCRICAOALGORIT').Size Then
     vDesc := Copy(vDesc,1,QryDet.FieldbyName('DESCRICAOALGORIT').Size);

  GravaDadosDetalhe;

  QryDet.DisableControls;
  SavePlace := QryDet.GetBookmark;
  QryDet.Close;
  QryDet.Open;
  QryDet.GotoBookmark(SavePlace);
  QryDet.EnableControls;

  TrataBotoesDetalhe;
  DesabilitaPanel;
  Dock974.Visible := False;
  dbgrdDet.Visible := True;
  dbgrdDet.BringToFront;
  lblalgoritmo.Visible := False;
  if (vTipoAlgoritmo = 1) or (vTipoAlgoritmo = 2) then
     chkValor.Checked := False;

  frmAguarde.Apaga;
end;

procedure TfrmCadRegra.sbtnBscVariavelClick(Sender: TObject);
begin
  inherited;
  xTipoTela := 1;
  frmConsulta.Showmodal;
  vIdCampo := xId;
  if xTipo = 'V' then begin
     vTpPasso1 := 2;
     BuscaFlags;
     if FlgVar = 0 then
        EdVariavel.Text := xDescricao
     else
        EdVariavel.Text := xId;
  end;
  edvariavel.SetFocus;
end;

procedure TfrmCadRegra.sbtnBscRegraClick(Sender: TObject);
begin
  inherited;
  xTipoTela := 5;
  frmConsulta.Showmodal;
  vIdCampo2 := xId;
  vTpPasso2 := 3;
  if xTipo = 'R' then vTpPasso2 := 5;
  edregra.text := xDescricao;
  edregra.SetFocus;
end;

procedure TfrmCadRegra.CmeDetalheInsert(Sender: TObject);
begin
  IniVariaveis;
  vTipoPasso := 0;
  AbrirFormModal(frmtipopasso,tfrmtipopasso);

  if UiTipoPasso = -1 then begin
     lblalgoritmo.Visible := False;
     dbgrdDet.BringToFront;
     if QryDet.IsEmpty then begin
        sbtnInsDet.Enabled := True;
        sbtnAltDet.Enabled := False;
        sbtnExcluiDet.Enabled := False;
        SbtnRenum.Enabled := False;
     end else begin
        sbtnInsDet.Enabled := True;
        sbtnAltDet.Enabled := True;
        sbtnExcluiDet.Enabled := True;
        SbtnRenum.Enabled := True;
     end;
     Exit;
  end;

  inherited;
  lblalgoritmo.Visible := True;
  liTipoPasso := uiTipoPasso;

  with QryAux do begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT MAX(IDALGORITMODAREG) MAXIMO FROM ALGREGRA WHERE IDREGRA = '+Qry.FieldbyName('IDREGRA').AsString);
       Open;
       vProximoAlgor := FieldbyName('MAXIMO').AsInteger + 10;
  end;

  vPasso := vProximoAlgor;
  vTipoAlgoritmo := liTipoPasso;

  Case  liTipoPasso of
        1,2,11 : begin {Atribuicao de valores}
                       panAtribVal.Visible := True;
                       panAtribVal.BringToFront;
                       if (LiTipoPasso = 1) or (LiTipoPasso = 2) then
                          chkvalor.Checked := False;
                       edtPassoVar.Text := InttoStr(vPasso);
                       edVar1.Text := '';
                       edValor5.Text := '';
                       if LiTipoPasso = 11 Then
                          chkvalor.Visible := False
                       else
                          chkvalor.Visible := True;
                 end;
        3..8 : begin {Comparacao de valores}
                  panCompara.Visible := True;
                  panCompara.BringToFront;
                  edComp1.Text := '';
                  edComp2.Text := '';
                  edtPassoCompara.Text := InttoStr(vPasso);
                  cmbCorrelacao.Text := '';

                  with QryAux do begin
                       Close;
                       Sql.Clear;
                       Sql.Add('SELECT IDALGORITMODAREG FROM ALGREGRA WHERE IDREGRA='+
                               Qry.FieldbyName('IDREGRA').AsString+' ORDER BY IDALGORITMODAREG');
                       Open;
                  end;
                  edtTrue.Items.Clear;
                  edtFalse.Items.Clear;
                  QryAux.First;
                  While not QryAux.Eof do begin
                        edtTrue.Items.Add(QryAux.FieldbyName('IDALGORITMODAREG').AsString);
                        edtFalse.Items.Add(QryAux.FieldbyName('IDALGORITMODAREG').AsString);
                        QryAux.Next;
                  end;
            end;
       9,12 : begin { Parar a Regra atual ou Finalizar }
                    panParar.Visible := True;
                    panParar.BringToFront;
                    vTpPasso1 := 3;
                    vTpPasso2 := 3;
                    edtParar.Text := InttoStr(vPasso);
                    if liTipoPasso = 9 then
                       vDesc := 'Parar a Regra atual';
                    if liTipoPasso = 12 then
                       vDesc := 'Finalizar execução da(s) Regra(s)';
            end;
       10 : begin {Input}
                  panImput.Visible := True;
                  panImput.BringToFront;
                  edVarInput.Text := '';
                  edtPassoInput.Text := InttoStr(vPasso);
                  vTpPasso2 := 2;
            end;
       13 : begin {mensagem}
                  panMensagem.Visible := True;
                  panMensagem.BringtoFront;
                  vTpPasso2 := 1;
                  edvalormsg.Text := '';
                  edtPassoMens.Text := InttoStr(vPasso);
                  edtValor.Text := vValor;
            end;
       14 : begin {Atribuição de regra}
                  panAtribRegra.Visible := True;
                  panAtribRegra.BringToFront;
                  edvariavel.Text := '';
                  edregra.Text := '';
                  edtPassoRegra.Text := InttoStr(vPasso);
            end;
       15 : begin {go to}
                  panGoto.Visible := True;
                  panGoto.BringToFront;
                  vTpPasso1 := 1;
                  vTpPasso2 := 1;
                  with QryAux do begin
                       Close;
                       Sql.Clear;
                       Sql.Add( 'SELECT IDALGORITMODAREG FROM ALGREGRA WHERE IDREGRA='+
                                Qry.FieldbyName('IDREGRA').AsString+' ORDER BY IDALGORITMODAREG');
                       Open;
                  end;
                  dedCmbGotoPasso.Items.Clear;
                  QryAux.First;
                  While not QryAux.Eof do begin
                        dedCmbGotoPasso.Items.Add(QryAux.FieldbyName('IDALGORITMODAREG').AsString);
                        QryAux.Next;
                  end;
                  edtPassoGoto.Text := InttoStr(vPasso);
            end;
       16 : begin {gravar no demonstrativo de calculo}
                  panDemonst.Visible := True;
                  panDemonst.BringToFront;
                  edValorDetalhe.Text := '';
                  edtValorDemonst.Text := '';
                  edtPassoDemonst.Text := InttoStr(vPasso);
                  cmbformat.ItemIndex := -1;
                  cmbdecimais.ItemIndex := -1;
                  vTpPasso1 := 1;
            end;
  end;
  TrataBotoesDetalhe;
end;

procedure TfrmCadRegra.edvariavelChange(Sender: TObject);
begin
  inherited;
  if vTipoAlgoritmo = 14 then begin
     vDesc := 'Atribuir à variável ' +edvariavel.text+' o valor da Regra: ' +edregra.text;
     lblalgoritmo.Caption := vDesc;
  end;
end;

procedure TfrmCadRegra.DesabilitaPanel;
begin
     lblalgoritmo.Visible := False;
     pnlControlesDet.Visible := False;
     panAtribVal.Visible := False;
     panCompara.Visible := False;
     panParar.Visible := False;
     panMensagem.Visible := False;
     panAtribRegra.Visible := False;
     panImput.Visible := False;
     panGoto.Visible := False;
     panDemonst.Visible := False;
end;

procedure TfrmCadRegra.TrataBotoesDetalhe;
begin
     if Qry.State in [dsEdit,dsInsert] Then begin
        sbtnInsDet.Enabled := True;
        if QryDet.IsEmpty then begin
           sbtnAltDet.Enabled := False;
           sbtnExcluiDet.Enabled := False;
           SbtnRenum.Enabled := False;
        end else begin
           sbtnAltDet.Enabled := True;
           sbtnExcluiDet.Enabled := True;
           SbtnRenum.Enabled := True;
        end;
        Dock974.Visible := True;
     end else begin
        sbtnInsDet.Enabled := False;
        sbtnAltDet.Enabled := False;
        sbtnExcluiDet.Enabled := False;
        SbtnRenum.Enabled := False;
        Dock974.Visible := False;
     end;
end;

procedure TfrmCadRegra.sbtnExcluiDetClick(Sender: TObject);
begin
     if MsgDlg('Deseja excluir este passo?','Atenção',mtConfirmation, [mbyes,mbno],0)=mryes then begin
        frmAguarde.Min := -1;
        frmAguarde.Mostra('Apagando passo ...');
        frmAguarde.Refresh;
        QryDet.Delete;
        QryDet.ApplyUpDates;
        frmAguarde.Apaga;
     end;
     sbtnExcluiDet.Down := False;
     vDet := True;
end;

procedure TfrmCadRegra.sbtnInsDetClick(Sender: TObject);
begin
// Testa Dados Tela
  If Trim(dedTipoRegra.Text) = '' Then Begin
    MsgDlg('É obrigatório informar o Tipo de Regra!',
           'Erro',mtError,[mbOk],0);
    dedTipoRegra.SetFocus;
    Exit;
  End;

  if QryDet.RecordCount >= 400 then begin   //SOL 183347 Kintana 1712386
     MsgDlg('O número de passos desta regra está no limite de 400 passos.','Atenção',mtConfirmation,[mbOk,mbHelp],0);
     SbtnInsDet.Down := False;
     Exit;
  end;
  frmAguarde.Min := -1;
  frmAguarde.Mostra('Verificando Dados ...');
  frmAguarde.Refresh;
  if vInsMst then begin
     qry.Post;
     qry.ApplyUpDates;
     qry.Edit;
  end;
  vInserir := True;
  LimparPassos;
  frmAguarde.Apaga;
  inherited;
  SbtnInsDet.Down    := False;
  SbtnInsDet.Enabled := False;
  lblalgoritmo.Caption := '';
  vDet := True;

  //BRUNO AZEVEDO SOL 179170 KINTANA 1648138 - INICIO
  if UiTipoPasso = -1 then begin
     lblalgoritmo.Visible := False;
     dbgrdDet.BringToFront;
     if QryDet.IsEmpty then begin
        sbtnInsDet.Enabled := True;
        sbtnAltDet.Enabled := False;
        sbtnExcluiDet.Enabled := False;
        SbtnRenum.Enabled := False;
     end else begin
        sbtnInsDet.Enabled := True;
        sbtnAltDet.Enabled := True;
        sbtnExcluiDet.Enabled := True;
        SbtnRenum.Enabled := True;
     end;
  end;
  //BRUNO AZEVEDO SOL 179170 KINTANA 1648138 - FIM
end;

procedure TfrmCadRegra.sbtnAltDetClick(Sender: TObject);
begin
  vInserir := False;
  lblalgoritmo.Visible := True;
  inherited;
  SbtnAltDet.Down    := False;
  sbtnAltDet.Enabled := False;
  lblalgoritmo.Caption := vDesc;
  vDet := True;

  //BRUNO AZEVEDO SOL 179169 KINTANA 1648129 - INICIO
  if UiTipoPasso = -1 then begin
     lblalgoritmo.Visible := False;
     sbtnInsDet.Enabled := True;
     sbtnAltDet.Enabled := True;
     sbtnExcluiDet.Enabled := True;
     SbtnRenum.Enabled := True;
     dbgrdDet.BringToFront;
  end;
  //BRUNO AZEVEDO SOL 179169 KINTANA 1648129 - FIM
end;

procedure TfrmCadRegra.sbtnBscCampoFormulaClick(Sender: TObject);
begin
  inherited;
  Case vTipoAlgoritmo of
       1 : xTipoTela := 2;
       2 : xTipoTela := 3;
      11 : xTipoTela := 4;
  End;

  frmConsulta.Showmodal;

  //BRUNO AZEVEDO SOL 179171 KINTANA 1648033 - INICIO
  if (Trim(xDescricao) <> '') then begin

    vIdCampo2  := xId;
    vFormula1 := 0;
    if (vTipoAlgoritmo = 1) or (vTipoAlgoritmo = 2) then
       vTpPasso2 := 3;
    edValor5.Text := xDescricao;
    vValor := '';
    if (vTipoAlgoritmo = 1) or (vTipoAlgoritmo = 2) then
       chkvalor.Checked := False;
    BuscaFlags;
    if xTipo = 'C' then begin
       vTpPasso2 := 1;
       if FlgCmp = 0 then
          edValor5.Text := xDescricao
       else
          edValor5.Text := xId;
    end;
    if xTipo = 'V' then begin
       vTpPasso2 := 2;
       if FlgVar = 0 then
          edValor5.Text := xDescricao
       else
          edValor5.Text := xId;
    end;
    if xTipo = 'F' then begin
       vTpPasso2 := 4;
       vFormula1  := StrtoInt(xId);
    end;
    if xTipo = 'R' then vTpPasso2 := 5;
    AtualizaDescr;
  end;
  //BRUNO AZEVEDO SOL 179171 KINTANA 1648033 - FIM
  edValor5.SetFocus;
end;

procedure TfrmCadRegra.edVar1Change(Sender: TObject);
begin
  inherited;
  AtualizaDescr;
end;

procedure TfrmCadRegra.chkerroClick(Sender: TObject);
begin
   inherited;
   if chkerro.Checked then vValor  := 'ERRO'
      else vValor  := '';
end;

procedure TfrmCadRegra.sbtnEd1Click(Sender: TObject);
begin
  inherited;
  SbtnListaValores.Visible := False;
  xTipoTela := 4;
  frmConsulta.Showmodal;
  edComp1.Text := xDescricao;
  vIdCampo := xId;
  vTpPasso1 := 3;
  BuscaFlags;
  if xTipo = 'C' then begin
     vTpPasso1 := 1;
     if FlgCmp = 0 then
        edComp1.Text := xDescricao
     else
        edComp1.Text := xId;
     SbtnListaValores.Visible := True;
  end;
  if xTipo = 'V' then begin
     vTpPasso1 := 2;
     if FlgVar = 0 then
        edComp1.Text := xDescricao
     else
        edComp1.Text := xId;
  end;
  if xTipo = 'F' then vTpPasso1 := 4;
  if xTipo = 'R' then vTpPasso1 := 5;
  edComp1.SetFocus;
  vCampoAux := xId;
end;

procedure TfrmCadRegra.sbtnEd2Click(Sender: TObject);
begin
  inherited;
  xTipoTela := 4;
  frmConsulta.Showmodal;
  edcomp2.text := xDescricao;
  vValor := '';
  vIdCampo2 := xId;
  vTpPasso2 := 3;
  BuscaFlags;
  if xTipo = 'C' then begin
     vTpPasso2 := 1;
     if FlgCmp = 0 then
        edComp2.Text := xDescricao
     else
        edComp2.Text := xId;
  end;
  if xTipo = 'V' then begin
     vTpPasso2 := 2;
     if FlgVar = 0 then
        edComp2.Text := xDescricao
     else
        edComp2.Text := xId;
  end;
  if xTipo = 'F' then vTpPasso2 := 4;
  if xTipo = 'R' then vTpPasso2 := 5;
  edComp2.SetFocus;
end;

procedure TfrmCadRegra.cmbCorrelacaoChange(Sender: TObject);
begin
  inherited;
  vCorrelacao := cmbCorrelacao.Text;
  if trim(cmbCorrelacao.Text) <> '='  then
    lblComp.Caption := 'que'
  else
    lblComp.Caption := 'a';

  if trim(cmbCorrelacao.Text) = 'Em' then begin
    lblComp.Caption := '';
    edComp2.Text := Trim(edComp2.Text);
    If (edComp2.Text = '') Or (edComp2.Text[1] <> '(') Then
      edComp2.Text := '('+edComp2.Text;
  end;

  DescricaoCompara;
end;

procedure TfrmCadRegra.edComp1Change(Sender: TObject);
begin
  inherited;
  DescricaoCompara;
  if trim(cmbCorrelacao.Text) = 'Em' then begin
    edComp2.Text := Trim(edComp2.Text);
    If (edComp2.Text = '') Or (edComp2.Text[1] <> '(') Then
      edComp2.Text := '('+edComp2.Text;
      
  end;

end;

procedure TfrmCadRegra.edComp2Exit(Sender: TObject);
Var
  Tam : Integer;
begin
  inherited;

  if trim(cmbCorrelacao.Text) = 'Em' then begin
    Tam := Length(edComp2.Text);
    If (edComp2.Text <> '') And (edComp2.Text[Tam] <> ')') Then
      edComp2.Text := edComp2.Text+')';
  end;


  with QryAux do begin // Verificar se é campo ou variavel
       Close;
       Sql.Clear;
       Sql.Add('SELECT CAMPODOBANCO,IDCAMPO FROM CMPBD WHERE DESCRICAODOCAMPO='''+edComp2.Text+'''');
       Open;
  end;

  if QryAux.IsEmpty then begin
     with QryAux do begin // Verificar é campo ou variavel
          Close;
          Sql.Clear;
          Sql.Add('SELECT CAMPODOBANCO,IDCAMPO,DESCRICAODOCAMPO FROM CMPBD WHERE IDCAMPO='''+edComp2.Text+'''');
          Open;
     end;
     if not QryAux.IsEmpty then begin
        vValor := '';
        vIdCampo2 := QryAux.FieldbyName('IDCAMPO').AsString;
        if QryAux.FieldbyName('CAMPODOBANCO').AsInteger = 0 Then
           vTpPasso2 := 2
        else
            vTpPasso2 := 1;
        vValor := '';

        chkbVlrConst.Checked := False;
     end else begin
         vIdCampo2 := '';
         vTpPasso2 := 3;
         vValor := edComp2.Text;
         chkbVlrConst.Checked := True;
     end;
  end else begin
      vValor := '';
      vIdCampo2 := QryAux.FieldbyName('IDCAMPO').AsString;
      if QryAux.FieldbyName('CAMPODOBANCO').AsInteger = 0 Then
         vTpPasso2 := 2
      else
         vTpPasso2 := 1;
      chkbVlrConst.Checked := False;
  end;
end;

procedure TfrmCadRegra.edComp1Exit(Sender: TObject);
begin
  inherited;
  SbtnListaValores.Visible := False;
  with QryAux do begin // Verificar se é Campo ou Variavel
       Close;
       Sql.Clear;
       Sql.Add('SELECT CAMPODOBANCO,IDCAMPO FROM CMPBD WHERE DESCRICAODOCAMPO='''+edComp1.Text+'''');
       Open;
  end;

  if not QryAux.IsEmpty then begin
     vIdCampo := QryAux.FieldbyName('IDCAMPO').AsString;
     if QryAux.FieldbyName('CAMPODOBANCO').AsInteger = 0 Then
        vTpPasso1 := 2
     else
        vTpPasso1 := 1;
  end else begin
      with QryAux do begin // Verificar se é Campo ou Variavel
           Close;
           Sql.Clear;
           Sql.Add('SELECT CAMPODOBANCO,DESCRICAODOCAMPO,IDCAMPO FROM CMPBD WHERE IDCAMPO='''+edComp1.Text+'''');
           Open;
      end;
      if not QryAux.IsEmpty then begin
         vIdCampo := QryAux.FieldbyName('IDCAMPO').AsString;
         if QryAux.FieldbyName('CAMPODOBANCO').AsInteger = 0 Then
            vTpPasso1 := 2
         else
             vTpPasso1 := 1;
      end else begin
          vIdCampo := edComp1.Text;
          vTpPasso1 := 3;
          SbtnListaValores.Visible := True;
          vCampoAux := vIdCampo;
      end;
  end;
end;

procedure TfrmCadRegra.bbtnpassosClick(Sender: TObject);
begin
  inherited;
  nbkPassos.PageIndex := 1;
end;

procedure TfrmCadRegra.bbtnfecharClick(Sender: TObject);
begin
  inherited;
  nbkPassos.PageIndex := 0;
end;

procedure TfrmCadRegra.FormCreate(Sender: TObject);
begin
  inherited;
  nbkPassos.PageIndex := 0;
  QryParam.Close;
  QryParam.Open;
  QryParam.First;
  vDet := False;
  { Preenche o ususario do MontaSelect de pesquisa de Regras }
  MontaSelect.Filtro.Add ('( GRUPOREGRAUSUARIO.IDUSUARIO = '+
                          IntToStr(Sistema.IdUsuario)+')');
  { Preenche o ususario do MontaSelect de pesquisa de Regras }
  msGeral.Filtro.Add ('( GRUPOREGRAUSUARIO.IDUSUARIO = '+
                      IntToStr(Sistema.IdUsuario)+')');

end;

procedure TfrmCadRegra.dedCmbGotoPassoChange(Sender: TObject);
begin
  inherited;
  try
     vTrue := StrtoInt(dedCmbGotoPasso.Text);
  except
        vTrue := 0;
  end;

  if dedCmbGotoPasso.ItemIndex > -1 then
     vTrue := StrtoInt(dedCmbGotoPasso.Text);

  if vTrue > 0 then vDesc := 'Vá para o passo '+dedCmbGotoPasso.Text
     else vDesc := 'Vá para o passo';
  lblalgoritmo.Caption := vDesc;
end;

function TfrmCadRegra.TrocaPontoVirgula(Value: String): String;
var
  iPosVirg : Integer;
begin
  iPosVirg := pos('.',Value);
  if iPosVirg <> 0 then
    Value := copy(Value,1,iPosVirg-1)+','+copy(Value,iPosVirg+1,length(Value));
  TrocaPontoVirgula := Value;
end;

procedure TfrmCadRegra.CmeDetalheEdit(Sender: TObject);
var
   OldTipoPasso : LongInt;
   Passou : Boolean;
   label 1;
begin
  Passou := False;
  OldTipoPasso := vTipoAlgoritmo;
  vTipoPasso := QryDet.FieldbyName('TIPOALGORITMO').AsInteger;
  AbrirFormModal(frmtipopasso,tfrmtipopasso);

  if UiTipoPasso = -1 then begin
     lblalgoritmo.Visible := False;
     sbtnInsDet.Enabled := True;
     sbtnAltDet.Enabled := True;
     sbtnExcluiDet.Enabled := True;
     SbtnRenum.Enabled := True;
     dbgrdDet.BringToFront;
     Exit;
  end;

  inherited;
  lblalgoritmo.Visible := True;
  liTipoPasso := uiTipoPasso;

  1:  begin
           if not Passou then begin
              Passou := True;
              vTipoAlgoritmo := UiTipoPasso;
              AtribuiValores;
           end else begin
               vTipoAlgoritmo := LiTipoPasso;
               OldTipoPasso := LiTipoPasso;
               AtribuiValores;
           end;
      end;

  Case  vTipoAlgoritmo of
        1,2,11 : begin {Atribuicao de valores}
                       panAtribVal.Visible := True;
                       panAtribVal.BringToFront;
                       if (vTipoAlgoritmo = 1) or (vTipoAlgoritmo = 2) then
                          chkvalor.Visible := True;
                       if OldTipoPasso = LiTipoPasso then begin
                          if LiTipoPasso = 11 Then begin
                             vValor := '';
                             chkvalor.Visible := False;
                          end;
                       end else begin
                           if (LiTipoPasso <> 1) and (LiTipoPasso <> 2) and (LiTipoPasso <> 11) then
                              Goto 1;
                       end;
                 end;
        3..8 : begin {Comparacao de valores}
                  panCompara.Visible := True;
                  panCompara.BringToFront;
                     with QryAux do begin
                          Close;
                          Sql.Clear;
                          Sql.Add( 'SELECT IDALGORITMODAREG FROM ALGREGRA WHERE IDREGRA='+
                                   Qry.FieldbyName('IDREGRA').AsString+' ORDER BY IDALGORITMODAREG');
                          Open;
                     end;
                     edtTrue.Items.Clear;
                     edtFalse.Items.Clear;
                     QryAux.First;
                     While not QryAux.Eof do begin
                           edtTrue.Items.Add(QryAux.FieldbyName('IDALGORITMODAREG').AsString);
                           edtFalse.Items.Add(QryAux.FieldbyName('IDALGORITMODAREG').AsString);
                           QryAux.Next;
                     end;
                     if (LiTipoPasso < 3) or (LiTipoPasso > 8) then
                         Goto 1;
               end;
       9,12 : begin { Parar a Regra atual ou Finalizar }
                    if OldTipoPasso <> LiTipoPasso then
                       Goto 1;
                    panParar.Visible := True;
                    panParar.BringToFront;
                    if liTipoPasso = 9 then
                       vDesc := 'Parar a Regra atual';
                    if liTipoPasso = 12 then
                       vDesc := 'Finalizar execução da(s) Regra(s)';
            end;
       10 : begin {Input}
                  if OldTipoPasso <> LiTipoPasso then
                     Goto 1;

                  panImput.Visible := True;
                  panImput.BringToFront;
            end;
       13 : begin {mensagem}
                  if OldTipoPasso <> LiTipoPasso then
                     Goto 1;
                  panMensagem.Visible := True;
                  panMensagem.BringtoFront;
            end;
       14 : begin {Atribuição de regra}
                  if OldTipoPasso <> LiTipoPasso then
                     Goto 1;

                  panAtribRegra.Visible := True;
                  panAtribRegra.BringToFront;

            end;
       15 : begin {go to}
                  panGoto.Visible := True;
                  panGoto.BringToFront;
                  with QryAux do begin
                       Close;
                       Sql.Clear;
                       Sql.Add( 'SELECT IDALGORITMODAREG FROM ALGREGRA WHERE IDREGRA='+
                                Qry.FieldbyName('IDREGRA').AsString+' ORDER BY IDALGORITMODAREG');
                       Open;
                  end;
                  dedCmbGotoPasso.Items.Clear;
                  QryAux.First;
                  While not QryAux.Eof do begin
                        dedCmbGotoPasso.Items.Add(QryAux.FieldbyName('IDALGORITMODAREG').AsString);
                        QryAux.Next;
                  end;
            end;
       16 : begin {gravar no demonstrativo de calculo}
                  panDemonst.Visible := True;
                  panDemonst.BringToFront;



            end;
  end;
  TrataBotoesDetalhe;
end;

function TfrmCadRegra.TipodeCampo(Valor : String; var Descricao : String) : LongInt;
begin
     if Valor = '' then begin
        Descricao := '';
        Result := 3;
        Exit;
     end;

     Result := 3;
     Descricao := '';
     with QryAux do begin
          Close;
          Sql.Clear;
          Sql.Add('SELECT IDCAMPO, CAMPODOBANCO, DESCRICAODOCAMPO, IDTIPODADO FROM CMPBD WHERE IDCAMPO='''+Valor+'''');
          Open;
          if not IsEmpty then begin
             if FieldbyName('CAMPODOBANCO').AsInteger > 0 then
                Result := 1
             else
                Result := 2;
             // Vinicius Ferreira SOL 170160 KINTANA 1520628
             IF FieldbyName('IDTIPODADO').AsInteger = 3 then
                Descricao := FieldbyName('IDCAMPO').AsString
             Else
                Descricao := FieldbyName('DESCRICAODOCAMPO').AsString;
             // Vinicius Ferreira SOL 170160 KINTANA 1520628
          end else begin
              Close;
              Sql.Clear;
              Sql.Add('SELECT DESCRICAOFORMULA FROM FORMULA WHERE IDFORMULA='''+Valor+'''');
              Open;
              if not IsEmpty then begin
                 Result := 4;
                 Descricao := FieldbyName('DESCRICAOFORMULA').AsString;
              end else begin
                  Close;
                  Sql.Clear;
                  Sql.Add('SELECT NOMEREGRA FROM REGRA WHERE IDREGRA='+Valor);
                  Open;
                  if not IsEmpty then begin
                     Result := 5;
                     Descricao := FieldbyName('NOMEREGRA').AsString;
                  End;
              end;
          end;
     end;
end;


procedure TfrmCadRegra.Sel( n : LongInt );
Begin
   qry.Close;
   qry.Params[0].Value := n;
   qry.Open;
   AbrePermissao(QryTipoRegra.FieldbyName('IDGRUPOREGRA').AsInteger,
                 QryTipoRegra.FieldbyName('IDTIPOREGRA').AsInteger);
End;


procedure TfrmCadRegra.dedIdRegraChange(Sender: TObject);
begin
  inherited;
  CmeDetalhe.OpenDataSet(Self);
end;


procedure TfrmCadRegra.edtPassoVarChange(Sender: TObject);
begin
  inherited;
  if EdtPassoVar.Text <> '' then
     vPasso := StrtoInt(EdtPassoVar.Text);
end;

procedure TfrmCadRegra.edtPassoComparaChange(Sender: TObject);
begin
  inherited;
  if EdtPassoCompara.Text <> '' Then
     vPasso := StrtoInt(EdtPassoCompara.Text);
end;

procedure TfrmCadRegra.edtPararChange(Sender: TObject);
begin
  inherited;
  if EdtParar.Text <> '' Then
     vPasso := StrtoInt(EdtParar.Text);
end;

procedure TfrmCadRegra.edtPassoMensChange(Sender: TObject);
begin
  inherited;
  if EdtPassoMens.Text <> '' then
     vPasso := StrtoInt(EdtPassoMens.Text);
end;

procedure TfrmCadRegra.edtPassoRegraChange(Sender: TObject);
begin
  inherited;
  if EdtPassoRegra.Text <> '' Then
     vPasso := StrtoInt(EdtPassoRegra.Text);
end;

procedure TfrmCadRegra.edtPassoInputChange(Sender: TObject);
begin
  inherited;
  if EdtPassoInput.Text <> '' Then
     vPasso := StrtoInt(EdtPassoInput.Text);
end;

procedure TfrmCadRegra.edtPassoGotoChange(Sender: TObject);
begin
  inherited;
  if EdtPassoGoto.Text <> '' Then
     vPasso := StrtoInt(EdtPassoGoto.Text);
end;

procedure TfrmCadRegra.edtPassoDemonstChange(Sender: TObject);
begin
  inherited;
  if EdtPassoDemonst.Text <> '' Then
     vPasso := StrtoInt(EdtPassoDemonst.Text);
end;

procedure TfrmCadRegra.LimparPassos;
begin
     EdtPassoVar.Text := '';
     EdtPassoCompara.Text := '';
     EdtParar.Text := '';
     EdtPassoMens.Text := '';
     EdtPassoRegra.Text := '';
     EdtPassoInput.Text := '';
     EdtPassoGoto.Text := '';
     EdtPassoDemonst.Text := '';
end;

procedure TfrmCadRegra.EditarPassos;
begin
     EdtPassoVar.Text := InttoStr(vPasso);
     EdtPassoCompara.Text := InttoStr(vPasso);
     EdtParar.Text := InttoStr(vPasso);
     EdtPassoMens.Text := InttoStr(vPasso);
     EdtPassoRegra.Text := InttoStr(vPasso);
     EdtPassoInput.Text := InttoStr(vPasso);
     EdtPassoGoto.Text := InttoStr(vPasso);
     EdtPassoDemonst.Text := InttoStr(vPasso);
end;

procedure TfrmCadRegra.IniVariaveis;
begin
     vFormula2 := 0;
     vTrue     := 0;
     vFalse    := 0;
     vTpPasso1 := 0;
     vTpPasso2 := 0;
     vForm     := 0;
     vFormula1 := 0;

     vIdCampo  := '';
     vIdCampo2 := '';
     vValor    := '';
     vDesc     := '';

     vCorrelacao := '';
end;

procedure TFrmCadRegra.GravaDadosDetalhe;
var
   vSql : String;
begin
     LimpaVarNaoUsadas;
     vSql := '';
     if vInserir then begin //Caso Insira
        
        If Trim(vIdCampo) = ''Then vIdCampo := 'NULL' Else vIdCampo := QuotedStr(vIdCampo);

        vSql := 'INSERT INTO ALGREGRA '+
                '(IDREGRA, IDALGORITMODAREG, IDCAMPO, CORRELACAO, FORMULA2, IDCAMPO2, '+
                'VALOR, TIPOALGORITMO, ALGORSUBSEQTRUE, FORMULA1, ALGORSUBSEQFALSE, DESCRICAOALGORIT, '+
                'TIPOCAMPO1, TIPOCAMPO2, FORMATACAO) VALUES('+
                InttoStr(Qry.FieldbyName('IDREGRA').AsInteger)+','+
                InttoStr(vPasso)+','+
                vIdCampo+','+
                ''''+vCorrelacao+''',';

        if vFormula2 = 0 then vSql := vSql + 'NULL,'
           else vSql := vSql + InttoStr(vFormula2)+',';

        vSql := vSql +''''+ vIdCampo2 +''','+''''+ vValor +''','+ InttoStr(vTipoAlgoritmo) +',';

        if vTrue = 0 then vSql := vSql + 'NULL,'
           else vSql := vSql + InttoStr(vTrue)+',';

        if vFormula1 = 0 then vSql := vSql + 'NULL,'
           else vSql := vSql + InttoStr(vFormula1)+',';

        if vFalse = 0 then vSql := vSql + 'NULL,'
           else vSql := vSql + InttoStr(vFalse)+',';

        vSql := vSql + ''''+vDesc+''','+ InttoStr(vTpPasso1)+','+InttoStr(vTpPasso2)+',';

        if vForm = 0 then vSql := vSql + 'NULL)'
           else vSql := vSql + InttoStr(vForm)+')';
     end else begin //Caso Altere
         vSql := 'UPDATE ALGREGRA SET '+
                 'IDREGRA = '+InttoStr(vIdRegra)+','+
                 'IDALGORITMODAREG = '+InttoStr(vPasso)+','+
                 'IDCAMPO = '''+vIdCampo+''','+
                 'CORRELACAO = '''+vCorrelacao+''',';
         if vFormula2 = 0 then
            vSql := vSql + 'FORMULA2 = NULL, '
         else
            vSql := vSql + 'FORMULA2 = '+InttoStr(vFormula2)+',';
         vSql := vSql + 'IDCAMPO2 = '''+vIdCampo2+''','+
                        'VALOR = '''+vValor+''','+
                        'TIPOALGORITMO = '+InttoStr(vTipoAlgoritmo)+','+
                        'DESCRICAOALGORIT = '''+vDesc+''','+
                        'TIPOCAMPO1 = '+InttoStr(vTpPasso1)+','+
                        'TIPOCAMPO2 = '+InttoStr(vTpPasso2)+',';

         if vTrue = 0 then vSql := vSql + 'ALGORSUBSEQTRUE = NULL, '
            else vSql := vSql + 'ALGORSUBSEQTRUE ='+InttoStr(vTrue)+',';

         if vFormula1 = 0 then vSql := vSql + 'FORMULA1 = NULL, '
            else vSql := vSql + 'FORMULA1 = '+InttoStr(vFormula1)+',';

         if vFalse = 0 then vSql := vSql + ' ALGORSUBSEQFALSE = NULL, '
            else vSql := vSql + ' ALGORSUBSEQFALSE ='+InttoStr(vFalse)+',';

         if vForm = 0 then vSql := vSql + 'FORMATACAO = NULL'
            else vSql := vSql + 'FORMATACAO = '+InttoStr(vForm);
            
         vSql := vSql + ' WHERE IDREGRA = '+InttoStr(vIdRegra)+' AND '+
                        'IDALGORITMODAREG = '+QryDet.FieldByName('IDALGORITMODAREG').AsString;
     end;


     with QryAux do begin
          Close;
          Sql.Clear;
          Sql.Add(vSql);
          try
             ExecSql;
          except
                MsgDlg('Erro na gravação da regra. Tente novamente.','Atenção',mtError,[mbOk,mbHelp],0)
          end;
     end;
end;

procedure TfrmCadRegra.edtValorDemonstChange(Sender: TObject);
begin
  inherited;
  if vTipoAlgoritmo = 16 then begin
     vValor := EdtValorDemonst.Text;
     vDesc := 'Gravar na memoria de calculo: '+
              trocapontovirgula(edtValorDemonst.Text)+' '+edValorDetalhe.text;

     lblalgoritmo.Caption := vDesc;
  end;
end;

procedure TfrmCadRegra.edtFalseExit(Sender: TObject);
begin
  inherited;
  if EdtFalse.Text <> '' then begin
     try
        vFalse := StrtoInt(EdtFalse.Text);
     except
        vFalse := 0;
     end;
  end else
      vFalse := 0;
  DescricaoCompara;
end;

procedure TfrmCadRegra.edtTrueExit(Sender: TObject);
begin
  inherited;
  if edtTrue.Text <> '' then begin
     try
        vTrue := StrtoInt(edtTrue.Text);
     except
           vTrue := 0;
     end;
  end else
      vTrue := 0;
  DescricaoCompara;
end;

procedure TfrmCadRegra.edtValorChange(Sender: TObject);
begin
  inherited;
  if vTipoAlgoritmo = 13 then begin
     vValor := edtValor.Text;
     vDesc := 'Exibir a mensagem:'+edtValor.Text+' '+edvalormsg.text;
     lblalgoritmo.Caption := vDesc;
  end;
end;

procedure TfrmCadRegra.EdtTextoImputarChange(Sender: TObject);
begin
  inherited;
  if vTipoAlgoritmo = 10 then begin
     vValor := EdtTextoImputar.Text;
     vDesc := 'Imputar um Valor à variável '+Trim(edvarinput.text)+ ' com a Msg:'+
              EdtTextoImputar.Text;
     lblalgoritmo.Caption := vDesc;
  end;
end;

procedure TfrmCadRegra.BuscaVariavel;
begin
  inherited;
  frmConsulta.Showmodal;
  vIdCampo := xId;
  if xTipo = 'V' then vTpPasso1 := 2;
end;


procedure TfrmCadRegra.SbtnImputClick(Sender: TObject);
begin
  inherited;
  xTipoTela := 1;
  frmConsulta.Showmodal;
  vIdCampo := xId;
  if xTipo = 'V' then vTpPasso1 := 2;
  BuscaFlags;
  if FlgCmp = 0 then
     edVarInput.Text := xDescricao
  else
     edVarInput.Text := xId;
  edVarInput.SetFocus;
end;

procedure TfrmCadRegra.sbtnBscVariavelVarClick(Sender: TObject);
begin
  inherited;
  Case vTipoAlgoritmo of
       1 : xTipoTela := 1;
       2 : xTipoTela := 3;
      11 : xTipoTela := 4;
  End;
  frmConsulta.Showmodal;
  vIdCampo := xId;
  BuscaFlags;
  if xTipo = 'V' then begin
     vTpPasso1 := 2;
     if FlgVar = 0 then
        EdVar1.Text := xDescricao
     else
        EdVar1.Text := xId;
  end;
  if xTipo = 'C' then begin
     if FlgCmp = 0 then
        EdVar1.Text := xDescricao
     else
        EdVar1.Text := xId;
     vTpPasso1 := 1;
  end;
  edVar1.SetFocus;
end;

procedure TfrmCadRegra.SbtnMensagemClick(Sender: TObject);
begin
  inherited;
  xTipoTela := 4;
  frmConsulta.Showmodal;
  vIdCampo  := xId;
  vTpPasso1 := 3;
  BuscaFlags;
  if xTipo = 'V' then begin
     vTpPasso1 := 2;
     if FlgVar = 0 then
        edvalormsg.Text := xDescricao
     else
        edvalormsg.Text := xId;
  end;
  if xTipo = 'C' then begin
     vTpPasso1 := 1;
     if FlgCmp = 0 then
        edvalormsg.Text := xDescricao
     else
        edvalormsg.Text := xId;
  end;
  edvalormsg.SetFocus;
end;

procedure TfrmCadRegra.sbtnFormulasValoresDemonstClick(Sender: TObject);
begin
  inherited;
  xTipoTela := 4;
  frmConsulta.Showmodal;
  vIdCampo  := xId;
  vFormula1 := 0;
  vTpPasso1 := 3;
  edValorDetalhe.Text := xDescricao;

  BuscaFlags;
  if xTipo = 'C' then begin
     vTpPasso1 := 1;
     if FlgCmp = 0 then
        edValorDetalhe.Text := xDescricao
     else
        edValorDetalhe.Text := xId;
  end;
  if xTipo = 'V' then begin
     vTpPasso1 := 2;
     if FlgVar = 0 then
        edValorDetalhe.Text := xDescricao
     else
        edValorDetalhe.Text := xId;
  end;
  if xTipo = 'F' then begin
     vTpPasso1 := 4;
     vFormula1  := StrtoInt(xId);
  end;
  if xTipo = 'R' then
    vTpPasso1 := 5;

  edValorDetalhe.SetFocus;
  ChBxValConst.Checked := False;
end;

procedure TfrmCadRegra.dbrgpPublicadaChange(Sender: TObject);
begin
  inherited;
  if dbrgpPublicada.ItemIndex = 0 then
     dbrgpPublicada.Enabled := False
  else
     dbrgpPublicada.Enabled := True;
end;

procedure TfrmCadRegra.LimpaVarNaoUsadas;
begin
     Case vTipoAlgoritmo of
        1,2,11 : begin {Atribuicao de valores}
                       if vIdCampo2 <> '' then
                          vValor := '';
                       if vValor <> '' then begin
                          vFormula1 := 0;
                          vIdCampo2 := '';
                       end;

                       vCorrelacao := '';
                       vFormula2 := 0;
                       vTrue  := 0;
                       vFalse := 0;
                       vForm  := 0;
                 end;
        3..8 : begin {Comparacao de valores}
                     vForm := 0;
                     vFormula2 := 0;
               end;
       9,12 : begin { Parar a Regra atual ou Finalizar }
                    vIdCampo := '';
                    vIdCampo2 := '';
                    vCorrelacao := '';
                    vValor := '';
                    vTrue := 0;
                    vFalse := 0;
                    vForm := 0;
                    vFormula1 := 0;
              end;
       10 : begin {Input}
                  vIdCampo2 := '';
                  vCorrelacao := '';
                  vTrue := 0;
                  vFalse := 0;
                  vForm := 0;
                  vFormula1 := 0;
                  vFormula2 := 0;
            end;
       13 : begin {mensagem}
                  vIdCampo2 := '';
                  vCorrelacao := '';
                  vTrue := 0;
                  vFalse := 0;
                  vForm := 0;
            end;
       14 : begin {Atribuição de regra}
                  vCorrelacao := '';
                  if vValor = '' then
                     vValor := '-1';
                  vTrue := 0;
                  vFalse := 0;
                  vForm := 0;
                  vFormula1 := 0;
                  vFormula2 := 0;
            end;
       15 : begin {go to}
                  vIdCampo := '';
                  vIdCampo2 := '';
                  vCorrelacao := '';
                  vValor := '';
                  vFalse := 0;
                  vForm := 0;
                  vFormula1 := 0;
                  vFormula2 := 0;
            end;
       16 : begin {gravar no demonstrativo de calculo}
                  vCorrelacao := '';
                  vFormula2 := 0;
                  vTrue := 0;
                  vFalse := 0;
                  vFormula1 := 0;
            end;
     End;
end;


procedure TfrmCadRegra.AtribuiValores;
var
   vDes,vDes2 : String;
   vFlag : Boolean;
   wPosRegra:Integer;
begin
     IniVariaveis;
     vTpPasso1 := QryDet.FieldbyName('TIPOCAMPO1').AsInteger;
     vTpPasso2 := QryDet.FieldbyName('TIPOCAMPO2').AsInteger;
     vDesc     := QryDet.FieldbyName('DESCRICAOALGORIT').AsString;
     vDes2     := QryDet.FieldbyName('DESCRICAOALGORIT').AsString;
     vPasso    := QryDet.FieldbyName('IDALGORITMODAREG').AsInteger;

     BuscaFlags;
     Case vTipoAlgoritmo of
        1,2,11 : begin {Atribuicao de valores}
                       edtPassoVar.Text := InttoStr(vPasso);
                       //Traz os Valores de Campo1
                       vIdCampo := QryDet.FieldbyName('IDCAMPO').AsString;
                       vTpPasso1 := TipodeCampo(vIdCampo, vDes);
                       edVar1.Text := vDes;
                       Case vTpPasso1 of
                            1 : begin
                                if FlgCmp = 0 then edVar1.Text := vDes
                                   else edVar1.Text := vIdCampo;
                                end;
                            2 : begin
                                     if FlgVar = 0 then edVar1.Text := vDes
                                        else edVar1.Text := vIdCampo;
                                end;
                       end;

                       //Traz os valores de Campo2
                       vIdCampo2 := QryDet.FieldbyName('IDCAMPO2').AsString;
                       vTpPasso2 := TipodeCampo(vIdCampo2, vDes);
                       edValor5.Text := vDes;
                       Case vTpPasso2 of
                            1 : begin
                                if FlgCmp = 0 then edValor5.Text := vDes
                                   else edValor5.Text := vIdCampo2;
                                end;
                            2 : begin
                                     if FlgVar = 0 then edValor5.Text := vDes
                                        else edValor5.Text := vIdCampo2;
                                end;
                       end;

                       vFormula1 := QryDet.FieldbyName('FORMULA1').AsInteger;

                       //Traz o Valor Constante se tiver
                       vValor := QryDet.FieldbyName('VALOR').AsString;
                       if (vValor <> '') and (vIdCampo2 = '') Then begin
                          edValor5.Text := vValor;
                          if (vTipoAlgoritmo = 1) or (vTipoAlgoritmo = 2) then begin
                             chkvalor.Visible := True;
                             chkvalor.Checked := True;
                          end;
                       end else begin
                           chkvalor.Visible := False;
                           chkvalor.Checked := False;
                       end;
                 end;
        3..8 : begin {Comparacao de valores}
                       edtPassoCompara.Text := InttoStr(vPasso);
                       //Traz os Valores de Campo1
                       vIdCampo := QryDet.FieldbyName('IDCAMPO').AsString;
                       vTpPasso1 := TipodeCampo(vIdCampo, vDes);
                       edComp1.Text := vDes;
                       Case vTpPasso1 of
                            1 : begin
                                if FlgCmp = 0 then edComp1.Text := vDes
                                   else edComp1.Text := vIdCampo;
                                end;
                            2 : begin
                                     if FlgVar = 0 then edComp1.Text := vDes
                                        else edComp1.Text := vIdCampo;
                                end;
                       end;

                       //Traz os valores de Campo2
                       vIdCampo2 := QryDet.FieldbyName('IDCAMPO2').AsString;
                       vTpPasso2 := TipodeCampo(vIdCampo2, vDes);
                       edComp2.Text := vDes;
                       Case vTpPasso2 of
                            1 : begin
                                if FlgCmp = 0 then edComp2.Text := vDes
                                   else edComp2.Text := vIdCampo2;
                                end;
                            2 : begin
                                     if FlgVar = 0 then edComp2.Text := vDes
                                        else edComp2.Text := vIdCampo2;
                                end;
                       end;
                       vFormula1 := QryDet.FieldbyName('FORMULA1').AsInteger;

                       
                       { Traz o Valor Constante se tiver }
                       vValor := QryDet.FieldbyName('VALOR').AsString;
                       if (vValor <> '') and (vIdCampo2 = '') Then Begin
                          edComp2.Text := vValor;
                          
                             chkbVlrConst.Checked := True;
                          
                       end else begin
                           chkbVlrConst.Checked := False;
                       end;
                       

                       { Preenche os Campos da Tela }
                       vCorrelacao        := QryDet.FieldbyName('CORRELACAO').AsString;
                       cmbCorrelacao.Text := vCorrelacao;
                       vTrue         := QryDet.FieldbyName('ALGORSUBSEQTRUE').AsInteger;
                       edtTrue.Text  := InttoStr(vTrue);
                       vFalse        := QryDet.FieldbyName('ALGORSUBSEQFALSE').AsInteger;
                       edtFalse.Text := InttoStr(vFalse);
               end;
       9,12 : begin { Parar a Regra atual ou Finalizar }
                    edtParar.Text := InttoStr(vPasso);
              end;
       10 : begin {Input}
                  edtPassoInput.Text := InttoStr(vPasso);
                  //Traz os Valores de Campo1
                  vIdCampo := QryDet.FieldbyName('IDCAMPO').AsString;
                  vTpPasso1 := TipodeCampo(vIdCampo, vDes);
                  Case vTpPasso1 of
                       1 : begin
                                if FlgCmp = 0 then edVarInput.Text := vDes
                                   else edVarInput.Text := vIdCampo;
                           end;
                       2 : begin
                                if FlgVar = 0 then edVarInput.Text := vDes
                                   else edVarInput.Text := vIdCampo;
                           end;
                  end;
                  vValor := QryDet.FieldbyName('VALOR').AsString;
                  EdtTextoImputar.Text := vValor;
            end;
       13 : begin {mensagem}
                  edtPassoMens.Text := InttoStr(vPasso);

                  vIdCampo := QryDet.FieldbyName('IDCAMPO').AsString;
                  vTpPasso1 := TipodeCampo(vIdCampo, vDes);
                  Case vTpPasso1 of
                       1 : begin
                                if FlgCmp = 0 then edvalormsg.Text := vDes
                                   else edvalormsg.Text := vIdCampo;
                           end;
                       2 : begin
                                if FlgVar = 0 then edvalormsg.Text := vDes
                                   else edvalormsg.Text := vIdCampo;
                           end;
                  end;
                  vValor := QryDet.FieldbyName('VALOR').AsString;
                  edtValor.Text := vValor;
            end;

       14:Begin
       { Atribuição de Regra }
            EdtPassoRegra.Text := InttoStr(vPasso);

            vIdCampo := QryDet.FieldbyName('IDCAMPO').AsString;
            vTpPasso1 := TipodeCampo(vIdCampo, vDes);
            Case vTpPasso1 of
              1:Begin
                  If FlgCmp = 0 then Edvariavel.Text := vDes
                  else edvariavel.Text := vIdCampo;
                End;
              2:Begin
                  If FlgVar = 0 then edvariavel.Text := vDes
                  Else edvariavel.Text := vIdCampo;
                End;
            End;

            vIdCampo2 := QryDet.FieldbyName('IDCAMPO2').AsString;
            vFlag := True;

            Try
              StrToInt(vIdCampo2);
            Except
              vFlag := False;
            End;

            If vFlag then begin

              with QryAux do begin
                Close;
                Sql.Clear;
                Sql.Add('SELECT NOMEREGRA FROM REGRA WHERE IDREGRA='+vIdCampo2);
                Open;
               
                If Not IsEmpty then begin
                  vTpPasso2:= 5;
                  wPosRegra := Pos('Regra: ',Trim(vDes2))+7;
                   { Retirado para não mostrar o nome de uma outra Regra com o mesmo ID }
                   If Trim(Copy(vDes2,wPosRegra,Length(vDesc))) <>
                      Trim(FieldbyName('NOMEREGRA').AsString)
                   Then
                     vDes := ''
                   Else
                     vDes := FieldbyName('NOMEREGRA').AsString;
                End Else Begin
                  vDes := ''
                End;
                
              end;
              edregra.Text := vDes;
            End else begin
              edRegra.Text := '';
            End;
       End; { 14:Begin - Atribuicao de Regra }

       15:Begin
       { Go To }
            EdtPassoGoto.Text := InttoStr(vPasso);
            vTrue := QryDet.FieldbyName('ALGORSUBSEQTRUE').AsInteger;
            dedCmbGotoPasso.Text := InttoStr(vTrue);
       End; { 14:Begin - Atribuicao de Regra }

       16 : Begin {gravar no demonstrativo de calculo}
                  edtPassoDemonst.Text := InttoStr(vPasso);
                  vIdCampo := QryDet.FieldbyName('IDCAMPO').AsString;
                  vTpPasso1 := TipodeCampo(vIdCampo, vDes);
                  Case vTpPasso1 of
                       1 : begin
                                if FlgCmp = 0 then edValorDetalhe.Text := vDes
                                   else edValorDetalhe.Text := vIdCampo;
                           end;
                       2 : begin
                                if FlgVar = 0 then edValorDetalhe.Text := vDes
                                   else edValorDetalhe.Text := vIdCampo;
                           end;
                  end;
                  vValor := QryDet.FieldbyName('VALOR').AsString;
                  edtValorDemonst.Text := vValor;
                  


                  { Preenche combo de Formatação case necessario }
                  cmbformat.itemindex   := -1;
                  cmbdecimais.itemindex := -1;
                  vForm     := QryDet.FieldbyName('FORMATACAO').AsInteger;
                  If vForm = 1 Then Begin
                    cmbformat.itemindex := (vForm - 1);
                  End Else If vForm = 2 Then Begin
                    cmbformat.itemindex := (vForm - 1);
                  End Else If vForm > 2 Then Begin
                    cmbdecimais.itemindex := (vForm - 3);
                    cmbformat.itemindex   := 1;
                  End;

                  vFormula1 := QryDet.FieldbyName('FORMULA1').AsInteger;
            end;
     End;
     EditarPassos;
end;

Function TfrmCadRegra.PesqId(Descricao : String; Tipo : LongInt) : String;
begin
      with QryAux do begin
           Close;
           Sql.Clear;
           Sql.Add('SELECT IDFORMULA FROM FORMULA WHERE DESCRICAOFORMULA = '''+Descricao+'''');
           Open;
      end;
      if not QryAux.IsEmpty then begin
         Result := QryAux.FieldbyName('IDFORMULA').AsString;
         vTpPasso2 := 4;
      end else begin
          with QryAux do begin
               Close;
               Sql.Clear;
               Sql.Add('SELECT IDREGRA FROM REGRA WHERE NOMEREGRA = '''+Descricao+'''');
               Open;
          end;
          if not QryAux.IsEmpty then begin
             Result := QryAux.FieldbyName('IDREGRA').AsString;
             vTpPasso2 := 5;
          end else begin
              with QryAux do begin
                   Close;
                   Sql.Clear;
                   Sql.Add('SELECT IDCAMPO, CAMPODOBANCO FROM CMPBD WHERE DESCRICAODOCAMPO = '''+Descricao+'''');
                   Open;
              end;
              if not QryAux.IsEmpty then begin
                 Case Tipo of
                      1 : begin
                               Result := QryAux.FieldbyName('IDCAMPO').AsString;
                               if QryAux.FieldbyName('CAMPODOBANCO').AsInteger = 0 then vTpPasso1 := 2
                                  else vTpPasso1 := 1;
                          end;
                      2 : begin
                               Result := QryAux.FieldbyName('IDCAMPO').AsString;
                               if QryAux.FieldbyName('CAMPODOBANCO').AsInteger = 0 then vTpPasso2 := 2
                                  else vTpPasso2 := 1;
                          end;
                 End;
              end else begin
                  Result := Descricao;
                  Case Tipo of
                       1 : vTpPasso1 := 3;
                       2 : vTpPasso2 := 3;
                  End;
              end;
          end;

      end;
end;

procedure TfrmCadRegra.AtribVal2;
begin
     vIdCampo2 := PesqId(vIdCampo2 , 2);
     Case vTpPasso2 of
           3 : begin
                    vValor := vIdCampo2;
                    vFormula1 :=0;
                    vIdCampo2 := '';
                    if (vTipoAlgoritmo = 1) or (vTipoAlgoritmo = 2) then
                       chkvalor.Checked := True;
               end;
           4 : begin
                    vValor := '';
                    vFormula1 := StrtoInt(vIdCampo2);
               end;
           1,2 : begin
                    vValor := '';
                    vFormula1 := 0;
                 end;
     End;
end;

procedure TfrmCadRegra.AtribVal1;
begin
     vIdCampo := PesqId(vIdCampo , 1);
end;

procedure TfrmCadRegra.edValor5Change(Sender: TObject);
var
   Aux : String;
begin
  inherited;
  if (chkvalor.Checked = false) then begin
     vIdCampo2 := edValor5.Text;
     AtribVal2;
     AtualizaDescr;
  end else begin
      vIdCampo2 := '';
      vValor := edValor5.Text;
      vFormula1 := 0;
      vTpPasso2 := 3;
      AtualizaDescr;
  end;
  if vTipoAlgoritmo = 11 then begin
     BuscaFlags;
     vValor := '';
     vFormula1 := 0;
     vIdCampo2 := PesqCMPBD(edValor5.Text);
     vTpPasso2 := TipodeCampo(vIdCampo2, Aux);
     Case vTpPasso2 of //Verificação se é variavel ou campo
          1 : begin
                   if FlgCmp = 0 then edValor5.Text := Aux
                      else edValor5.Text := vIdCampo2;
              end;
          2 : begin
                   if FlgVar = 0 then edValor5.Text := Aux
                      else edValor5.Text := vIdCampo2;
              end;
     end;
  end;
  AtualizaDescr;
end;

function TFrmCadRegra.VerificaCampos : Boolean;
var
   Cmp : String;
begin
     Result := True;
     Cmp := '';
     Case vTipoAlgoritmo of
        1,2,11 : begin {Atribuicao de valores}
                       if edtPassoVar.Text = '' then begin
                          Cmp := Cmp + 'Nº do Passo, ';
                          Result := False;
                       end;

                       if edVar1.Text = '' then begin
                          Cmp := Cmp + 'Operando nº 1, ';
                          Result := False;
                       end;
                 end;
        3..8 : begin {Comparacao de valores}
                       if edtPassoCompara.Text = ''then begin
                          Cmp := Cmp + 'Nº do Passo, ';
                          Result := False;
                       end;

                       if (edComp1.Text = '') then begin
                          Cmp := Cmp + 'Operando nº 1, ';
                          Result := False;
                       end;

                       if cmbCorrelacao.Text = '' then begin
                          Cmp := Cmp + 'Correlação, ';
                          Result := False;
                       end;

                       if (edtTrue.Text = '') or (edtTrue.Text = '0') then begin
                          Cmp := Cmp + 'Nº passo (Se sim), ';
                          Result := False;
                       end;

                       if (edtFalse.Text = '') or (edtFalse.Text = '0') then begin
                          Cmp := Cmp + 'Nº passo (Senão), ';
                          Result := False;
                       end;
               end;
       9,12 : begin { Parar a Regra atual ou Finalizar }
                    if edtParar.Text = '' then begin
                       Cmp := Cmp + 'Nº do Passo, ';
                       Result := False;
                    end;
              end;
       10 : begin {Input}
                  if edtPassoInput.Text = '' then begin
                     Cmp := Cmp + 'Nº do Passo, ';
                     Result := False;
                  end;

                  if edVarInput.Text = '' then begin
                     Cmp := Cmp + 'Nome da Variável, ';
                     Result := False;
                  end;
            end;
       13 : begin {mensagem}
                  if edtPassoMens.Text = '' then begin
                     Cmp := Cmp + 'Nº do Passo, ';
                     Result := False;
                  end;
            end;
       14 : begin {Atribuição de regra}
                  if edtPassoRegra.Text = '' then begin
                     Cmp := Cmp + 'Nº do Passo, ';
                     Result := False;
                  end;

                  if edvariavel.Text = '' then begin
                     Cmp := Cmp + 'Variável, ';
                     Result := False;
                  end;

                  if edregra.Text = '' then begin
                     Cmp := Cmp + 'Regra, ';
                     Result := False;
                  end;
            end;
       15 : begin {go to}
                  if edtPassoGoto.Text = '' then begin
                     Cmp := Cmp + 'Nº do Passo, ';
                     Result := False;
                  end;

                  if dedCmbGotoPasso.Text = '' then begin
                     Cmp := Cmp + 'Vá para o passo, ';
                     Result := False;
                  end;
            end;
       16 : begin {gravar no demonstrativo de calculo}
                  if edtPassoDemonst.Text = '' then begin
                     Cmp := Cmp + 'Nº do Passo, ';
                     Result := False;
                  end;

                  if edtValorDemonst.Text = '' then begin
                     Cmp := Cmp + 'Descrição, ';
                     Result := False;
                  end;
            end;
     End;
     if not Result then begin
        Cmp := Copy(Trim(Cmp),1,Length(Trim(Cmp))-1);
        MsgDlg('O(s) Campo(s) '+Cmp+' precisa(m) ser preenchido(s).','Atenção',mtError,[mbOk,mbHelp],0)
     end;
end;

procedure TfrmCadRegra.sbtnApagarClick(Sender: TObject);
Var
  sTextoLog : String;
begin
  if (QryPermissao.Fieldbyname('FLGEXCLUIR').AsInteger = 0) or (QryPermissao.IsEmpty) then begin
    MsgDlg('O usuário ('+Sistema.NomeUsuario+') não está autorizado a utilizar esta operação.','Erro',mtError,[mbOk,mbHelp],0);
    sbtnApagar.Down := False;
    Exit;
  end;

  if Qry.FieldByName('PUBLICADA').AsInteger = 1 then begin
    MsgDlg('Esta operação não será realizada por esta regra ser Publicada.','Erro',mtError,[mbOk,mbHelp],0);
    sbtnApagar.Down := False;
    Exit;
  end;

  

  { Não permite excluir Regra que esteja sendo usada como "filha" de outra }
  With dtmRelDetalhes.QryPai Do Begin
    Close;
    ParambyName('ID').AsString := dedIdRegra.Text;
    Open;

    If Not IsEmpty Then Begin
      MsgDlg('Esta regra está sendo utilizada por outra, '+#13+
             'não pode ser excluida!','Erro',mtError,[mbOk],0);
      sbtnApagar.Down := False;
      Close;
      Exit;
    End;
    Close;
  End;
  

  if MsgDlg('Deseja excluir a regra ?','Atenção',mtConfirmation, [mbyes,mbno],0) = mrYes then begin
    frmAguarde.Mostra('Apagando passos da regra ...');
    frmAguarde.Refresh;
    Try
// Inicia Transação no Banco de Dados
      dtmBaseDados.dbBaseDados.StartTransaction;
// Tenta Excluir dados da Regra
      with QryAux do begin
        Close;
        Sql.Clear;
        Sql.Add('DELETE FROM ALGREGRA WHERE IDREGRA = '+Qry.FieldbyName('IDREGRA').AsString);
        ExecSql;
      end;
      frmAguarde.Mostra('Apagando regra ...');
      frmAguarde.Refresh;
      with QryAux do begin
        Close;
        Sql.Clear;
        Sql.Add('DELETE FROM REGRA WHERE IDREGRA = '+Qry.FieldbyName('IDREGRA').AsString);
        ExecSql;
      end;

      {-----------------------------------}
      { Gravar log de operação 19/12/2002 }
      sTextoLog := 'Exclusão da Regra de Negócio '+dedIdRegra.Text;

      { Grava Log da operação - 19/12/2002 }
      If Not Sistema.GravaLogOperacoes(sTextoLog) Then
        Raise Exception.Create('Não Consegui Gravar o Log');

// Confirma Transação no Banco de Dados
      dtmBaseDados.dbBaseDados.Commit;
    Except
      On E:Exception Do Begin
        Beep;
// Cancela Transação no Banco de Dados
        dtmBaseDados.dbBaseDados.RollBack;
// Mostra nmensagem de Erro
        MsgDlg('Erro, com a mensagem :'+#13+E.Message+#13+
               '. Provavelmente algum registro esta utilizando esta Regra.',
               'Mensagem do Sistema ', MtError, [MbOk], 0);
      End;
    End;

    Qry.Close;
    QryDet.Close;

    Qry.Open;
    QryDet.Open;

    frmAguarde.Apaga;
  end;
  sbtnApagar.Down := False;
end;

procedure TfrmCadRegra.DescricaoCompara;
begin
  if (vTipoAlgoritmo >= 3) or (vTipoAlgoritmo <= 8) then begin
     vDesc := 'Se '+Trim(edComp1.Text)+' '+Trim(cmbCorrelacao.Text)+' '+
              Trim(edComp2.Text)+' então execute o passo '+
              edtTrue.Text+' '+' senão,execute o passo '+edtFalse.Text;
     lblalgoritmo.Caption := vDesc;
  end;
end;

procedure TfrmCadRegra.AtualizaDescr;
var
   sInicio, sFim : String;
begin
     Case vTipoAlgoritmo of
          1 : begin
                   sInicio := 'Atribuir à variável ';
                   if chkvalor.Checked then sFim :=' o valor constante '
                      else sFim :=' o valor da formula ';
                   vDesc := sInicio + edVar1.Text + sFim + edValor5.Text;
              end;
          2 : begin
                   sInicio := 'Atribuir ao campo ';
                   if chkvalor.Checked then sFim :=' o valor constante '
                      else sFim :=' o valor do Campo ';
                   vDesc := sInicio + edVar1.Text + sFim + edValor5.Text;
              end;
          //BRUNO AZEVEDO SOL 179172 KINTANA 1648139 - INICIO
          3..8 : vDesc := 'Se '+Trim(vIdCampo)+' '+Trim(cmbCorrelacao.Text)+' '+
                          Trim(edComp2.Text)+' então execute o passo '+
                          edtTrue.Text+' '+' senão,execute o passo '+edtFalse.Text;
          {3..8 : vDesc := 'Se '+Trim(edComp1.Text)+' '+Trim(cmbCorrelacao.Text)+' '+
                          Trim(edComp2.Text)+' então execute o passo '+
                          edtTrue.Text+' '+' senão,execute o passo '+edtFalse.Text; }
          //BRUNO AZEVEDO SOL 179172 KINTANA 1648139 - FIM
          9 : vDesc := 'Parar a Regra atual';
          10: vDesc := 'Imputar um Valor à variável '+Trim(edvarinput.text)+ ' com a Msg:'+EdtTextoImputar.Text;
          11: begin
                   if vTpPasso1 = 1 then sInicio := 'Atribuir ao campo '
                      else sInicio := 'Atribuir à variavel ';
                   if vTpPasso2 = 1 then sFim := ' o valor do campo '
                      else sFim := ' o valor da variável ';
                   vDesc := sInicio + edVar1.Text + sFim + edValor5.Text;
              end;
          12: vDesc := 'Finalizar execução da(s) Regra(s)';
          13: vDesc := 'Exibir a mensagem:'+edtValor.Text+' '+edvalormsg.text;
          14: vDesc := 'Atribuir à variável ' +edvariavel.text+' o valor da Regra: ' +edregra.text;
          15: vDesc := 'Vá para o passo '+dedCmbGotoPasso.Text;
          16: Begin
                vDesc := 'Gravar na Memória de Cálculo ';
                if ChBxValConst.Checked = True Then
                  vDesc := vDesc + 'o valor Constante : '
                else
                  vDesc := vDesc + ': ';
                vDesc := vDesc +
                  TrocaPontoVirgula(edtValorDemonst.Text)+' '+edValorDetalhe.text;
              End;
     end;
     lblalgoritmo.Caption := vDesc;
end;

procedure TfrmCadRegra.sbtnGeralClick(Sender: TObject);
var
   vIdOld : LongInt;
begin
     inherited;
     if dedIdRegra.Text <> '' then begin
        msGeral.ItemsBusca.Clear;
        msGeral.ItemsBusca.Add(dedIdRegra.Text);
     end;
     vIdOld := Qry.Fieldbyname('IDREGRA').AsInteger;
     msGeral.Executar;
     Refresh;
     if msGeral.RetornouValor then begin
        try
           StrtoInt(msGeral.ValoresChave[2])
        except
              MsgDlg('O usuário ('+Sistema.NomeUsuario+') não está autorizado a utilizar esta operação.','Erro',mtError,[mbOk,mbHelp],0);
              SbtnGeral.Down := False;
              Exit;
        end;


        if AbrePermissao(StrtoInt(msGeral.ValoresChave[2]),
                         StrtoInt(msGeral.ValoresChave[3])) then begin
           frmAguarde.Mostra('Selecionando Dados ...');
           frmAguarde.Refresh;
           vIdRegra := StrToInt(msGeral.ValoresChave[0]);

           Qrydet.DisableControls;
           Sel( vIdRegra );
           QryDet.Locate('IDALGORITMODAREG', msGeral.ValoresChave[1],[]);

           if (QryPermissao.FieldByName('FLGPROCURAR').AsInteger = 0) or (QryPermissao.IsEmpty) then begin
              MsgDlg('O usuário ('+Sistema.NomeUsuario+') não está autorizado a utilizar esta operação.','Erro',mtError,[mbOk,mbHelp],0);
              SbtnGeral.Down := False;
              Sel( vIdOld );
           end;
           Qrydet.EnableControls;

           TrataBotoes( True );
           frmAguarde.Apaga;
        end else begin
            MsgDlg('O usuário ('+Sistema.NomeUsuario+') não está autorizado a utilizar esta operação.','Erro',mtError,[mbOk,mbHelp],0);
            SbtnGeral.Down := False;
        end;
     end;
     SbtnGeral.Down := False;
     vDet := False;
end;

procedure TfrmCadRegra.BuscaFlags;
begin
     FlgCmp := QryParam.FieldbyName('FLGCAMPO').AsInteger;
     FlgVar := QryParam.FieldbyName('FLGVARIAVEL').AsInteger;
end;

Function TfrmCadRegra.PesqCMPBD(Identificador : String) : String;
begin
      Result := '';
      with QryAux do begin
           Close;
           Sql.Clear;
           Sql.Add('SELECT CAMPODOBANCO, DESCRICAODOCAMPO FROM CMPBD WHERE IDCAMPO='''+Identificador+'''');
           Open;
      end;
      if QryAux.IsEmpty then begin
         with QryAux do begin
              Close;
              Sql.Clear;
              Sql.Add('SELECT IDCAMPO, CAMPODOBANCO, DESCRICAODOCAMPO FROM CMPBD WHERE DESCRICAODOCAMPO='''+Identificador+'''');
              Open;
         end;
         if not QryAux.IsEmpty then
            Result := QryAux.FieldbyName('IDCAMPO').AsString;
      end else begin
          Result := Identificador;
      end;
end;

procedure TfrmCadRegra.SpeedButton2Click(Sender: TObject);
begin
  inherited;
   if trim(edregra.text) <> '' then begin
    application.createform(tfrmcampospararegra,frmcampospararegra);
    idregra:=strtoint(vIdCampo2);
    If QryDet.Fieldbyname('VALOR').AsString <> '' Then
      frmcampospararegra.rg1.itemindex := QryDet.Fieldbyname('VALOR').AsInteger;
    frmcampospararegra.showmodal;
    frmcampospararegra.free;
    vValor := InttoStr(TemQry);
  end else
    MsgDlg('Preencha a regra primeiro !','Erro',mtError,[mbOk,mbHelp],0);
end;

procedure TfrmCadRegra.SbtnListaValoresClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(tFrmListaValores, FrmListaValores);
  FrmListaValores.ShowModal;
  FrmListaValores.Free;               
  SbtnListaValores.Visible := False;
  if vCampoAux <> '' then begin
     edComp2.Text := vCampoAux;
     edComp2.SetFocus;
  end;
end;

function TfrmCadRegra.AbrePermissao( Grupo, Tipo : LongInt ) : Boolean;
begin
  With QryPermissao do begin
    Close;
    ParambyName('GRUPO').AsInteger   := Grupo;
    ParambyName('TIPO').AsInteger    := Tipo;
    ParambyName('USUARIO').AsInteger := Sistema.IdUsuario;
    Open;
  End;
  Result := True;
  if QryPermissao.IsEmpty then
     Result := False;

end;

procedure TfrmCadRegra.dedTipoRegraExit(Sender: TObject);
begin
  inherited;

  AbrePermissao(QryTipoRegra.FieldbyName('IDGRUPOREGRA').AsInteger,
                QryTipoRegra.FieldbyName('IDTIPOREGRA').AsInteger);
  if Qry.State = dsInsert then begin
        if (QryPermissao.FieldByName('FLGINSERIR').AsInteger = 0) or (QryPermissao.IsEmpty) then begin
           MsgDlg('O usuário ('+Sistema.NomeUsuario+') não está autorizado a incluir este tipo de regra.','Erro',mtError,[mbOk,mbHelp],0);
           dedTipoRegra.SetFocus;
           Exit;
        end
  end else begin
      if Qry.State = dsEdit then begin
         if (QryPermissao.FieldByName('FLGALTERAR').AsInteger = 0) or (QryPermissao.IsEmpty) then begin
               MsgDlg('O usuário ('+Sistema.NomeUsuario+') não está autorizado a alterar para este tipo de regra.','Erro',mtError,[mbOk,mbHelp],0);
               dedTipoRegra.SetFocus;
               Exit;
         end;
      end;
  end;

end;

procedure TfrmCadRegra.chkbVlrConstClick(Sender: TObject);
begin
  inherited;
  if chkbVlrConst.Checked  then begin
     vIdCampo2 := '';
     vValor := edComp2.Text;
     vFormula1 := 0;
     vTpPasso2 := 3;
  end else begin
      with QryAux do begin // Verificar se é campo ou variavel
           Close;
           Sql.Clear;
           Sql.Add('SELECT CAMPODOBANCO,IDCAMPO FROM CMPBD WHERE DESCRICAODOCAMPO='''+edComp2.Text+'''');
           Open;
      end;
      if QryAux.IsEmpty then begin
         with QryAux do begin // Verificar é campo ou variavel
              Close;
              Sql.Clear;
              Sql.Add('SELECT CAMPODOBANCO,IDCAMPO,DESCRICAODOCAMPO FROM CMPBD WHERE IDCAMPO='''+edComp2.Text+'''');
              Open;
         end;
         if not QryAux.IsEmpty then begin
            vValor := '';
            vIdCampo2 := QryAux.FieldbyName('IDCAMPO').AsString;
            if QryAux.FieldbyName('CAMPODOBANCO').AsInteger = 0 Then
               vTpPasso2 := 2
            else
                vTpPasso2 := 1;
            vValor := '';
         end else begin
             vIdCampo2 := '';
             vTpPasso2 := 3;
             vValor := edComp2.Text;
         end;
      end else begin
          vValor := '';
          vIdCampo2 := QryAux.FieldbyName('IDCAMPO').AsString;
          if QryAux.FieldbyName('CAMPODOBANCO').AsInteger = 0 Then
             vTpPasso2 := 2
          else
             vTpPasso2 := 1;
      end;
  end;
  AtualizaDescr;
end;

procedure TfrmCadRegra.CmeDetalheOpenDataSet(Sender: TObject);
begin
  inherited;

  with QryDet do begin
       Close;
       ParambyName('ID').AsInteger := Qry.FieldbyName('IDREGRA').AsInteger;
       try
          Open;
       except

       end;
  end;
end;

procedure TfrmCadRegra.CmbFormatChange(Sender: TObject);
begin
  inherited;

  if cmbformat.itemindex = 1 then begin
    lbldec.Visible      := true;
    cmbdecimais.visible := true;
  end else begin
    lbldec.Visible      := false;
    cmbdecimais.visible := false;
  end;

  If cmbformat.itemindex = -1 then          { Sem Formatacao }
    vForm := 0
  Else if cmbformat.itemindex = 0 then      { Moeda }
    vForm := cmbformat.itemindex + 1
  Else Begin                                { Outros Sem Decimal }
    If Trim(cmbdecimais.Text) = '' Then
      vForm := cmbformat.itemindex + 1      { Sem Decimal }
    Else
      vForm := cmbformat.itemindex + 1 + cmbdecimais.itemindex + 1; { Com Decimal }

  End;

  { Caso combo de moeda vazio zera Formatação }
  If Trim(cmbformat.Text) = '' Then
    vForm := 0;
end;

procedure TfrmCadRegra.ChBxValConstClick(Sender: TObject);
begin
  inherited;
  If ChBxValConst.Checked = True Then Begin
    vIdCampo2 := '';
    vTpPasso2 := 3;
    
  End;

end;

procedure TfrmCadRegra.edValorDetalheExit(Sender: TObject);
begin
  inherited;
//------------------------------------------------------------------------------
// Verificar se Valor é um Campo
  with QryAux do begin
    Close;
    Sql.Clear;
    Sql.Add('SELECT CAMPODOBANCO,IDCAMPO FROM CMPBD WHERE DESCRICAODOCAMPO='''+
            Trim(edValorDetalhe.Text)+'''');
    Open;
  end;

  if QryAux.IsEmpty then begin
// Não sendo CAMPO Verificar se Valor é uma Variavel
     with QryAux do begin
          Close;
          Sql.Clear;
          Sql.Add('SELECT CAMPODOBANCO,IDCAMPO,DESCRICAODOCAMPO FROM CMPBD WHERE IDCAMPO='''+
                  Trim(edValorDetalhe.Text)+'''');
          Open;
     end;
     If not QryAux.IsEmpty then begin
        
        vIdCampo2 := QryAux.FieldbyName('IDCAMPO').AsString;
        if QryAux.FieldbyName('CAMPODOBANCO').AsInteger = 0 Then
          vTpPasso2 := 2
        else
            vTpPasso2 := 1;

        chkbVlrConst.Checked := False;
     end else begin
// Não sendo CAMPO - VARIAVEL Verificar se Valor é Literal
       vIdCampo2 := '';
       vTpPasso2 := 3;

       ChBxValConst.Checked := True;
     end;
  end else begin

      vIdCampo2 := QryAux.FieldbyName('IDCAMPO').AsString;
      if QryAux.FieldbyName('CAMPODOBANCO').AsInteger = 0 Then
         vTpPasso2 := 2
      else
         vTpPasso2 := 1;
      ChBxValConst.Checked := False;
  end;
end;

procedure TfrmCadRegra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  QryParam.Close;
end;

procedure TfrmCadRegra.dedNomeEnter(Sender: TObject);
begin
  inherited;
  

  { Não permite Alterar Nome Regra que esteja sendo usada como "filha" de outra }
  dedNome.Enabled := True;
  With dtmRelDetalhes.QryPai Do Begin
    Close;
    ParambyName('ID').AsString := dedIdRegra.Text;
    Open;

    If Not IsEmpty Then Begin
      dedNome.Enabled := False;
      MsgDlg('Esta regra está sendo utilizada por outra, '+#13+
             'seu nome não pode ser alterado!','Aviso',mtWarning,[mbOk],0);
      dedNome.Enabled := False;
    End;
    Close;
  End;
  
end;

end.




