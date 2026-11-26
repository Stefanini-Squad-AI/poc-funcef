// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//  Autor      : Claudio Faria
//  Pendência  : 22804
//  Data       : 13/03/2007
//  Descricao  : Permitir impressão do relatório por lote utilizando nova tela
//               herdando da TFrmReports_Folha
//------------------------------------------------------------------------------
unit FPRelCredBenefAgen;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FReports_Folha, Db, Wwdatsrc, DBTables, Wwquery, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, wwdblook, Spin,
  ExtCtrls, usistema, dbasedados;

type
  TFrmPRelCredBenefAgen = class(TFrmReports_Folha)
    Panel1: TPanel;
    Label3: TLabel;
    Label1: TLabel;
    edtAssina1: TEdit;
    edtAssina2: TEdit;
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPRelCredBenefAgen: TFrmPRelCredBenefAgen;

implementation

uses dRelFolha, fAguarde;

{$R *.DFM}

procedure TFrmPRelCredBenefAgen.bbtnConfirmarClick(Sender: TObject);
Var sSQL : String;
begin
  inherited;

  dtmBaseDados.dbBaseDados.StartTransaction;
  if not Sistema.GravaLogOperacoes('Emissão: '+caption) then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;


  sSQL := ' SELECT H.CODPORTFORMA, PC.NOCONTACORR, PF.DESCRICAO AS CENTRALIZA, ' + #13 +
          '        H.NUMBANCO, H.NOME, H.NUMAGENCIA, H.AGENCIA, ' + #13 +
          '        SUM(H.VALORPROVENTO) AS VALOR, ' + #13 +
          '        COUNT(DISTINCT H.IDRESPONSAVEL) AS QUANTIDADE ' + #13 +
          ' FROM (SELECT TD.CODPORTFORMA, ' + #13 +
          '              TD.IDRESPONSAVEL, TD.MES, BA.NUMBANCO, BAN.NOME, AG.NUMAGENCIA, ' + #13 +
          '              AGENCIA.NOME AS AGENCIA, TD.VALORPROVENTO AS VALOR2, ' + #13 +
          '              PR.FLGESPECIAL, PR.FLGDESCONTO, ' + #13 +
          '              DECODE(PR.FLGDESCONTO,0, ' + #13 +
          '                     DECODE(PR.FLGESPECIAL,0,TD.VALORPROVENTO,0), ' + #13 +
          '                     DECODE(PR.FLGESPECIAL,0,TD.VALORPROVENTO*-1,0)) VALORPROVENTO ';

  If RdoTipoFolha.ItemIndex = 0 Then
    sSQL := sSQL + '       FROM PREVIA TD, '
  Else
    sSQL := sSQL + '       FROM HISTRUBSAL TD, ';

  sSQL := sSQL + ' 	       PROVDESC PR, ' + #13 +
                 '             CONTABANCARIA CB, ' + #13 +
                 '             AGENCIABANCARIA AG, ' + #13 +
                 '             BANCO BA, ' + #13 +
                 '             PESSOA AGENCIA, ' + #13 +
                 '             PESSOA BAN, ' + #13 +
                 '             BANCOPORTFORMA BPF ';

  If RdoTipoFolha.ItemIndex = 0 Then
    sSQL := sSQL + '       WHERE (TD.IDLOTE = ' + IntToStr(qryPreviaouEfetivada.FieldByName('IDLOTE').AsInteger) + ') '
  Else
    sSQL := sSQL + '  	   WHERE (TD.IDHSTFOLHABENEF = ' + IntToStr(qryPreviaouEfetivada.FieldByName('IDHSTFOLHABENEF').AsInteger) + ') ';

  sSQL := sSQL + '         AND (PR.IDPROVENTO = TD.IDRUBRICA) ' + #13 +
                 '         AND (PR.FLGESPECIAL <> 2) ' + #13 +
                 '         AND (CB.FLGCONTAPREF = 1) ' + #13 +
                 '         AND (CB.IDPESSOA = TD.IDRESPONSAVEL) ' + #13 +
                 '         AND (CB.IDAGENCIA = AG.IDPESSOA) ' + #13 +
                 '         AND (BA.IDPESSOA = AG.IDBANCO) ' + #13 +
                 '         AND (AGENCIA.IDPESSOA = AG.IDPESSOA) ' + #13 +
                 '         AND (BAN.IDPESSOA = BA.IDPESSOA) ' + #13 +
                 '         AND (TD.CODPORTFORMA = BPF.CODPORTFORMA) ';

  If RdoTipoFolha.ItemIndex <> 0 Then
    sSQL := sSQL + '         AND (TD.FLGESTORNO = 0 OR TD.FLGESTORNO IS NULL) ';

  sSQL := sSQL + '         AND (BPF.IDMODULO = 18)  ) H,  ' + #13 +
                 '      PORTADORFORMA PF, ' + #13 +
                 '      PORTADORCONTA PC ' + #13 +
                 ' WHERE H.CODPORTFORMA = PF.CODPORTFORMA ' + #13 +
                 '   AND PF.CODPORTADOR = PC.CODPORTADOR ' + #13 +
                 ' GROUP BY H.CODPORTFORMA, PC.NOCONTACORR, PF.DESCRICAO, ' + #13 +
                 '          H.NUMBANCO, H.NOME, H.NUMAGENCIA, H.AGENCIA ';

  dtmRelFolha.qryCredBenefAgen.Close;
  dtmRelFolha.qryCredBenefAgen.Prepare;
  dtmRelFolha.qryCredBenefAgen.SQL.Text := sSQL;

  // preenche labels com assinaturas.
  If RdoTipoFolha.ItemIndex = 0 Then
    dtmRelFolha.rpCredBenefAgenLabel10.Caption := 'Lote da Prévia: : '+
      qryPreviaouEfetivada.FieldByName('DESCRICAO').AsString
  Else
    dtmRelFolha.rpCredBenefAgenLabel10.Caption := 'Versão da Folha de Benefícios : '+
      qryPreviaouEfetivada.FieldByName('DESCRICAO').AsString;

  dtmRelFolha.lblassina1.caption := edtAssina1.Text;
  dtmRelFolha.lblassina2.caption := edtAssina2.Text;
  dtmRelFolha.qryCredBenefAgen.Open;
  frmAguarde.Close;
end;

end.
