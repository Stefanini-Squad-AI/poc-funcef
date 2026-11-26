// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//  Autor      : Claudio Faria
//  Pendência  : 22806
//  Data       : 13/03/2007
//  Descricao  : Permitir impressão do relatório por lote utilizando nova tela
//               herdando da TFrmReports_Folha
//------------------------------------------------------------------------------
unit fPRelPagtoIndiv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FReports_Folha, Db, Wwdatsrc, DBTables, Wwquery, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, wwdblook, Spin,
  ExtCtrls, fAguarde, uSistema, dbasedados;

type
  TfrmPRelPagtoIndiv = class(TFrmReports_Folha)
    Panel1: TPanel;
    Label3: TLabel;
    edtAssina1: TEdit;
    edtAssina2: TEdit;
    Label1: TLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPRelPagtoIndiv: TfrmPRelPagtoIndiv;

implementation

uses dRelPagtoIndiv;

{$R *.DFM}

procedure TfrmPRelPagtoIndiv.bbtnConfirmarClick(Sender: TObject);
Var sSQL : String;
begin
  inherited;
  dtmBaseDados.dbBaseDados.StartTransaction;
  if not Sistema.GravaLogOperacoes('Emissão: '+caption) then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  dtmRelPagtoIndiv.qryPagtoIndiv.Close;

  If RdoTipoFolha.ItemIndex = 0 Then
  Begin
    sSQL := ' SELECT PV.CODPORTFORMA, PF.DESCRICAO AS CENTRALIZA, P1.NOME AS NOMEPESSJUR, ' + #13 +
            '        P2.NOME AS BENEF, P2.NUMDOCUMENTO, EL.MATRICULA, ' + #13 +
            '        '' '' AS NODOCUMENTO, '' '' AS COMPLDOCUMENTO, '' '' AS DATAVENCTO, ' + #13 +
            '        SUM (DECODE (PR.FLGDESCONTO, 0, ' + #13 +
            ' 	                  DECODE (PR.FLGESPECIAL, 0, PV.VALORPROVENTO, 0), ' + #13 +
            '                     DECODE (PR.FLGESPECIAL, 0, PV.VALORPROVENTO * -1, 0))) VALOR ' + #13 +
            ' FROM PREVIA PV, ' + #13 +
            '      PROVDESC PR, ' + #13 +
            '      ELEGPATRO EL, ' + #13 +
            '      PESSOA P1, ' + #13 +
            '      PESSOA P2, ' + #13 +
            '      PORTADORFORMA PF ' + #13 +
            ' WHERE (PV.IDLOTE       = ' + IntToStr(qryPreviaouEfetivada.FieldByName('IDLOTE').AsInteger) + ') ' + #13 +
            '   AND (PR.IDPROVENTO   = PV.IDRUBRICA) ' + #13 +
            '   AND (PR.FLGESPECIAL  = 0) ' + #13 +
            '   AND (PR.FLGDESCONTO  IN (0, 1)) ' + #13 +
            '   AND (PR.FLGESPECIAL  <> 2) ' + #13 +
            '   AND (PF.CODPORTFORMA = PV.CODPORTFORMA) ' + #13 +
            '   AND (EL.IDPESSOA     = PV.IDTITULAR) ' + #13 +
            '   AND (EL.IDPESSJUR    = PV.IDPATRO) ' + #13 +
            '   AND (P1.IDPESSOA     = PV.IDPATRO) ' + #13 +
            '   AND (P2.IDPESSOA     = PV.IDRESPONSAVEL) ' + #13 +
            ' GROUP BY PV.CODPORTFORMA, ' + #13 +
            '          PF.DESCRICAO, ' + #13 +
            '          P1.NOME, ' + #13 +
            '          EL.MATRICULA, ' + #13 +
            '          P2.NUMDOCUMENTO, ' + #13 +
            '          P2.NOME ';

    dtmRelPagtoIndiv.rpCredBenefAgenLabel10.caption := 'Lote da Prévia: ' + dblkLoteouVersao.Text;
  End
  Else
  Begin  
    sSQL := ' SELECT H.CODPORTFORMA, ' + #13 +
            '       PF.DESCRICAO AS CENTRALIZA, ' + #13 +
            '       P1.NOME AS NOMEPESSJUR, ' + #13 +
            '       P2.NOME AS BENEF, ' + #13 +
            '       P2.NUMDOCUMENTO, ' + #13 +
            '       EL.MATRICULA, ' + #13 +
            '       D.NODOCUMENTO, D.COMPLDOCUMENTO, D.DATAVENCTO, ' + #13 +
            '       SUM(DECODE(PR.FLGDESCONTO,0, ' + #13 +
            '                  DECODE(PR.FLGESPECIAL,0,H.VALORPROVENTO,0), ' + #13 +
            '                  DECODE(PR.FLGESPECIAL,0,H.VALORPROVENTO*-1,0))) VALOR ' + #13 +
            ' FROM HISTRUBSAL H, HSTFOLHABENEFCAP HCAP, PROVDESC PR, ELEGPATRO EL, ' + #13 +
            '      PESSOA P1, PESSOA P2, DOCUMENTO D, PORTADORFORMA PF ' + #13 +
            ' WHERE (H.IDHSTFOLHABENEF = ' + IntToStr(qryPreviaouEfetivada.FieldByName('IDHSTFOLHABENEF').AsInteger) + ') ' + #13 +
            '   AND (NVL(H.FLGESTORNO,0) = 0) ' + #13 +
            '   AND (PR.IDPROVENTO       = H.IDRUBRICA) ' + #13 +
            '   AND (PR.FLGESPECIAL      <> 2) ' + #13 +
            '   AND (H.IDHSTFOLHABENEF   = HCAP.IDHSTFOLHABENEF) ' + #13 +
            '   AND (HCAP.TIPOPORTADOR   <> ''A'') ' + #13 +
            '   AND (H.CODPORTFORMA      = HCAP.CODPORTFORMA) ' + #13 +
            '   AND (H.CODDOCUMENTO      = HCAP.CODDOCUMENTO) ' + #13 +
            '   AND (PF.CODPORTFORMA     = H.CODPORTFORMA) ' + #13 +
            '   AND (EL.IDPESSOA         = H.IDTITULAR) ' + #13 +
            '   AND (EL.IDPESSJUR        = H.IDPATRO) ' + #13 +
            '   AND (P1.IDPESSOA         = H.IDPATRO) ' + #13 +
            '   AND (P2.IDPESSOA         = H.IDRESPONSAVEL) ' + #13 +
            '   AND (H.CODDOCUMENTO      = D.CODDOCUMENTO(+)) ' + #13 +
            ' GROUP BY H.CODPORTFORMA, PF.DESCRICAO, P1.NOME, EL.MATRICULA, P2.NUMDOCUMENTO, ' + #13 +
            '          P2.NOME,D.NODOCUMENTO, D.COMPLDOCUMENTO, D.DATAVENCTO ';

    dtmRelPagtoIndiv.rpCredBenefAgenLabel10.caption := 'Versão: ' + dblkLoteouVersao.Text;
  End;

  frmAguarde.Mostra('Aguarde... Montando Relatório.');
  dtmRelPagtoIndiv.qryPagtoIndiv.SQL.Text := sSQL;
  dtmRelPagtoIndiv.qryPagtoIndiv.Open;
  dtmRelPagtoIndiv.lblassina1.caption := edtAssina1.Text;
  dtmRelPagtoIndiv.lblassina2.caption := edtAssina2.Text;
end;

end.
