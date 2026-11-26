{====>   DESENVOLVEDOR NÃO ESQUEÇA DE COMENTAR SUAS ALTERAÇÕES AO LONGO DO
         CÓDIGO, ASSIM COMO COLOCAR A DESCRIÇÃO DA IMPLEMENTAÇÃO/ALTERAÇÃO
         NO HISTÓRICO DE ALTERAÇÕES NO FINAL DESTE ARQUIVO ********************}
unit FCadLayoutDescontoSaida;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, Mask, wwdbedit, FCadastroCs, UMensErro,
  {$IFNDEF VERSAO0505} uCMTypes, {$ENDIF}
  UDatabase, DBaseDados, UModulo, UIntegraBack, UFuncoesFolha;

type
  TfrmCadLayoutDescontoSaida = class(TfrmCadMestreDetalheCS)
    Label1: TLabel;
    dbedtDescricao: TwwDBEdit;
    qryIDLAYOUTSAIDA: TFloatField;
    qryDESCRICAO: TStringField;
    qryCOLMATRICULA: TFloatField;
    qryTAMMATRICULA: TFloatField;
    qryCOLINSCRICAO: TFloatField;
    qryTAMINSCRICAO: TFloatField;
    qryCOLVALORRUB: TFloatField;
    qryTAMVALORRUB: TFloatField;
    qryCOLVALORDES: TFloatField;
    qryTAMVALORDES: TFloatField;
    qryCOLVALORDIF: TFloatField;
    qryTAMVALORDIF: TFloatField;
    qryCOLRUBRICA: TFloatField;
    qryTAMRUBRICA: TFloatField;
    qryCOLNOME: TFloatField;
    qryTAMNOME: TFloatField;
    qryCOLSEQDEP: TFloatField;
    qryTAMSEQDEP: TFloatField;
    qryCOLSEQRUB: TFloatField;
    qryTAMSEQRUB: TFloatField;
    qryCOLEXCESSO: TFloatField;
    qryTAMEXCESSO: TFloatField;
    qryCOLMESREF: TFloatField;
    qryTAMMESREF: TFloatField;
    qryCOLMESCOB: TFloatField;
    qryTAMMESCOB: TFloatField;
    panel1: TPanel;
    gbxrubricas: TGroupBox;
    Label7: TLabel;
    Label11: TLabel;
    dbedtPosicaoMatricula: TwwDBEdit;
    dbedtTamMatricula: TwwDBEdit;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    dbedtposicaoinscricao: TwwDBEdit;
    dbedtposicaotamanho: TwwDBEdit;
    Panel2: TPanel;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label8: TLabel;
    dbedtPosicaoValEfet: TwwDBEdit;
    dbedtTamanhoValEfet: TwwDBEdit;
    qryCOLCONTROLE: TFloatField;
    qryTAMCONTROLE: TFloatField;
    Panel4: TPanel;
    GroupBox5: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    dbedtPosicaoCODRUBRICA: TwwDBEdit;
    dbedtTamanhoRubrica: TwwDBEdit;
    GroupBox8: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    dbedtPosicaoSeqRubrica: TwwDBEdit;
    dbedtTamanhoSeqRubrica: TwwDBEdit;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    dbedtPosicaovalorRubrica: TwwDBEdit;
    dbedtTamanhovalorrubrica: TwwDBEdit;
    GroupBox4: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    dbedtPosicaoValDif: TwwDBEdit;
    dbedtTamanhoValDif: TwwDBEdit;
    GroupBox6: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    dbedtPosicaoNome: TwwDBEdit;
    dbedtTamanhoNome: TwwDBEdit;
    GroupBox7: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    dbedtPosicaoSeqDep: TwwDBEdit;
    dbedtTamanhoSeqDep: TwwDBEdit;
    GroupBox12: TGroupBox;
    Label40: TLabel;
    Label41: TLabel;
    dbedtPosControle: TwwDBEdit;
    dbEdtTamControle: TwwDBEdit;
    GroupBox9: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    dbedtPosicaoExceDebito: TwwDBEdit;
    dbedtTamanhoExceDebito: TwwDBEdit;
    GroupBox10: TGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    wwDBEdit1: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    GroupBox11: TGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    posmesref: TwwDBEdit;
    tammesref: TwwDBEdit;
    grbPrazo: TGroupBox;
    lbPosIniPrazo: TLabel;
    lbSizePrazo: TLabel;
    dbedSizePrazo: TwwDBEdit;
    dbedPosIniPrazo: TwwDBEdit;
    qryCOLPRAZO: TFloatField;
    qryTAMPRAZO: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
     lstPosicoes : tstringlist;
  public
    { Public declarations }
  end;

var
  frmCadLayoutDescontoSaida: TfrmCadLayoutDescontoSaida;

implementation

{$R *.DFM}

procedure TfrmCadLayoutDescontoSaida.FormShow(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.Prepare;
  pnlcontrolesdet.bringtofront;
  pnlcontrolesdet.visible := true;
end;

procedure TfrmCadLayoutDescontoSaida.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
  begin
    qry.close;
    qry.parambyname('IDLAYOUT').asinteger:=strtoint(MontaSelect.ValoresChave[0]);
    qry.open;
    pnlcontrolesdet.bringtofront;
    pnlcontrolesdet.visible := true;
  end;
end;

procedure TfrmCadLayoutDescontoSaida.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  try
    qry.FieldByName('IDLAYOUTSAIDA').asinteger:=LeUltRegistro(nil,'LAYOUTDESCONTOSAIDA');
  except
    showmessage('erro');
  end;
end;

procedure TfrmCadLayoutDescontoSaida.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  try
    if CmeCadastro.operacao in [opInserir, opAlterar] then
    begin
      AplicaAlteracoes([qry]);
    end
  except
    Screen.Cursor := crDefault;
    Raise;
    Repaint;
  end;
end;

procedure TfrmCadLayoutDescontoSaida.sbtnInserirClick(Sender: TObject);
begin
  if not(qry.Active) then
    qry.open;
  inherited;
  dbedtDescricao.SETFOCUS;
end;

procedure TfrmCadLayoutDescontoSaida.bbtnConfirmarClick(Sender: TObject);
Var Q, IndA, IndB, iQuantidade, iPosicao, iTamanho,
    iPosOutro, iTamOutro : Integer;
    bErro : Boolean;
    sTamanho, sPosicao : String;

{Sub}
Procedure Adiciona(St1,St2:String);
begin
  If (StrToIntDef(St1,0)>0)Or(StrToIntDef(St2,0)>0) then
  begin
    lstPosicoes.Add(Trim(St1)+';'+Trim(St2));
    Inc(iQuantidade);
  end;
end; {Adiciona}

{Sub}
Procedure MostraMsg(Tp:Byte);
Var Msg: String;
begin
  Case Tp Of
    1: Msg:='Existem Posições definidas sem o Tamanho correspondente.';
    2: Msg:='Existem Tamanhos definidos sem a Posição correspondente.';
    3: Msg:='Existem Posições sobrepostas na definição do lay-out';
  end; {Case}
  bErro := true;
  MsgDlg(Msg,'Atenção', mtWarning, [mbOk, mbHelp], 0);
end; {MostraMsg}

begin
  bErro := false;
  // Verificacao da consistencia
  lstPosicoes.clear;
  lstPosicoes.Sorted:=false;
  With qry do
  begin
    // 1) Matricula
    Adiciona(Fieldbyname('COLMATRICULA').asString,Fieldbyname('TAMMATRICULA').asString);
    // 2) Nº de Inscricao
    Adiciona(Fieldbyname('COLINSCRICAO').asString,Fieldbyname('TAMINSCRICAO').asString);
    // 3) Nome do Participante
    Adiciona(Fieldbyname('COLNOME').asString,Fieldbyname('TAMNOME').asString);
    // 4) Codigo de Controle
    Adiciona(Fieldbyname('COLCONTROLE').asString,Fieldbyname('TAMCONTROLE').asString);
    // 5) Codigo da Rubrica
    Adiciona(Fieldbyname('COLRUBRICA').asString,Fieldbyname('TAMRUBRICA').asString);
    // 6) Nº Sequencial da Rubrica
    Adiciona(Fieldbyname('COLSEQRUB').asString,fieldbyname('TAMSEQRUB').asString);
    // 7) Diferenca do valor da Rubrica
    Adiciona(Fieldbyname('COLVALORDIF').asString,fieldbyname('TAMVALORDIF').asString);
    // 8) Valor da Rubrica
    Adiciona(Fieldbyname('COLVALORRUB').asString,fieldbyname('TAMVALORRUB').asString);
    // 9) Valor Efetivamente Descontado
    Adiciona(Fieldbyname('COLVALORDES').asString,fieldbyname('TAMVALORDES').asString);
    // 10) Ano / Mes de Referencia
    Adiciona(Fieldbyname('COLMESREF').asString,fieldbyname('TAMMESREF').asString);
    // 11) Ano / Mes de Cobranca
    Adiciona(Fieldbyname('COLMESCOB').asString,fieldbyname('TAMMESCOB').asString);
    // 12) Ano / Mes de Cobranca
    Adiciona(Fieldbyname('COLEXCESSO').asString,qry.fieldbyname('TAMEXCESSO').asString);
    // 13) Prazo
    Adiciona(FieldByName('COLPRAZO').AsString, FieldByName('TAMPRAZO').AsString);
  end; {With}

  If iQuantidade>1 then
  begin
    (* Necessário Decrementar iQuantidade *)
    Dec(iQuantidade);
    (* ====================== *)

    (* Prepara Informação no stringList *)
    (* Não haverá ordenação *)
    For Q := 0 to iQuantidade do
    begin
      sPosicao:=Piece(lstPosicoes[Q],';',1);
      iPosicao:=StrToIntDef(sPosicao,0);
      If iPosicao<10 then sPosicao:='0'+IntToStr(iPosicao);

      sTamanho:=Piece(lstPosicoes[Q],';',2);
      iTamanho:=StrToIntDef(sTamanho,0);
      If iTamanho<10 then sTamanho:='0'+IntToStr(iTamanho);

      lstPosicoes[Q]:= sPosicao+';'+sTamanho;
    end; {For}

    For Q := 0 to iQuantidade do
    begin
      iPosicao:=StrToIntDef(Piece(lstPosicoes[Q],';',1),0);
      iTamanho:=StrToIntDef(Piece(lstPosicoes[Q],';',2),0);

      If (iPosicao>0)And(iTamanho=0) then MostraMsg(1);

      If (iPosicao=0)And(iTamanho>0) then MostraMsg(2);

      IndA:=0;
      If (iPosicao>0)And(iTamanho>0) then
      Repeat
        Inc(IndA);
        IndB:=0;
        Repeat
          If IndB<>Q then
          begin
            iPosOutro:=StrToIntDef(Piece(lstPosicoes[IndB],';',1),0);
            iTamOutro:=StrToIntDef(Piece(lstPosicoes[IndB],';',2),0);
            If ((iPosicao+IndA)-1 In [iPosOutro..(iPosOutro+iTamOutro)-1])And
                (iPosOutro>0)And(iTamOutro>0) then MostraMsg(3);
          end;
          Inc(IndB);
        Until(IndB>=iQuantidade)Or(bErro);
      Until(IndA>=iTamanho)Or(bErro);
    end; {For iQuantidade}
  end; {iQuantidade>1}

  If not bErro then
  begin
    inherited;
    pnlcontrolesdet.bringtofront;
    pnlcontrolesdet.visible := true;
  end;
end;

procedure TfrmCadLayoutDescontoSaida.FormCreate(Sender: TObject);
begin
  inherited;
  lstPosicoes:=tstringlist.create;
  lstPosicoes.Duplicates:=dupAccept;
end;

procedure TfrmCadLayoutDescontoSaida.FormDestroy(Sender: TObject);
begin
  inherited;
  lstPosicoes.free;
end;

end.
{==============================================================================|
| UNIT: FCADLAYOUTDESCONTOSAIDA                                                |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   CADASTRO DE LAYOUTS DE ARQUIVO TEXTO PARA RETORNO AS ENTIDADES EXTERNAS    |
|                                                                              |
|==============================================================================|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 30/01/2002 A 30/01/2002                         |
| VERSÃO PARA LIBERAÇÃO: ?                                                     |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   ACERTO NO OBJETO UPD,                                                      |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 04/04/2002 A 04/04/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12f                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   INCLUSÃO DO MÊS E ANO DE REFERENCIA                                        |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei de Brito Marins.                                       |
| PERÍODO DE IMPLEMENTAÇÃO: DE 06/11/2002 A 06/11/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (CBS) - Pendência 9727.                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Inclusão da Informação Codigo de Controle.       |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Fernando Jorge                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 06/01/2003 A 06/01/2003                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF) - Pendência 10946.                                         |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Inclusao de rotina para checagem da consistencia |
| das informações do layout.                                                   |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei de Brito Marins.                                       |
| PERÍODO DE IMPLEMENTAÇÃO: DE 13/01/2002 A 13/01/2002.                        |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF) - Pendência 11472.                                         |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Acerto e modificação da rotina que verifica as   |
|  posições dos campos no lay-out.                                             |                                                                |
|==============================================================================}
