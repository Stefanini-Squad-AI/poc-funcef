unit fParamRecebimento;
{-----------------------------------------------------------------------------------------
 Data       : 26.03.2007
 Autor      : Antonio Marcos Fernandes de Souza (amf)
 Pendência  : 24854
 Descrição  : Corrige o total de recebimento. Não estava considerando o fornecedor
              mesmo que estivesse selecionado.
---------------------------------------------------------------------------------
Data     : 20.03.2006
Autor    : Antonio Marcos Fernandes de Souza (amf)
Pendência: 21547
Descrição: Alteração na QryRecebimento. Vide abaixo.
-----------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, ExtCtrls, wwdblook,  MAHlpBtn, Buttons,
  TB97Tlbr, TB97, Db, DBTables, Wwquery, IvDictio, IvMulti, IvEMulti,
  CMProcuraSubTipo, uCMTypes, StdCtrls, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmParamRecebimento = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    deDataInicial: TCMDateTimePicker;
    deDataFinal: TCMDateTimePicker;
    dblkcmbAlmox: TwwDBLookupCombo;
    Label4: TLabel;
    qryAlmox: TwwQuery;
    cmpForn: TCMProcuraForCli;
    RgTipo: TRadioGroup;
    rgOrdem: TRadioGroup;
    chkEstoque: TCheckBox;
    GroupBox2: TGroupBox;
    chlDestEst: TCheckBox;
    chkDestAtivo: TCheckBox;
    chkDestCusto: TCheckBox;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamRecebimento: TfrmParamRecebimento;

implementation

uses DRelatoriosAlmox, usistema;

{$R *.DFM}

procedure TfrmParamRecebimento.bbtnConfirmarClick(Sender: TObject);
Var
   sDestino : String;
begin
  inherited;
  sDestino :='';

  If chlDestEst.Checked Then
     sDestino := QuotedStr('E') + ',';
  If chkDestAtivo.Checked Then
     sDestino := sDestino + QuotedStr('A') + ',';
  If chkDestCusto.Checked Then
     sDestino := sDestino + QuotedStr('C') + ',';

  sDestino :=  copy(sDestino,1,Length(sDestino)-1);

  If ( Trim(cmpForn.text) <> '' ) And (cmpForn.Valida <> vcOk) Then
     Begin
        cmpForn.SetFocus;
        ModalResult := mrNone;
     End
  Else
     Begin
         ModalResult := mrOK;
         With DtmRelatoriosAlmox.qryRecebimento Do
           Begin
               Close;
               Sql.Clear;
               Sql.Add(' SELECT ');
               Sql.Add('     AL.DESCALMOX AS ALMOXARIFADO, ');
               Sql.Add('     P.RAZAOSOCIAL AS FORNECEDOR, ');
               Sql.Add('     NF.DATAENTDEVOL as DATAEMISNF, ');
               Sql.Add('     DECODE(NF.COMPLNF,'''',TO_CHAR(NF.NUMNF), RTRIM(TO_CHAR(NF.NUMNF),'' '')||''/''||NF.COMPLNF) AS NNF, ');
               Sql.Add('     AR.CODARTIGO, ');
               Sql.Add('     SUBSTR(DECODE(IT.IDPRODVARI,NULL,PR.DESCPROD||'' ''||RTRIM(AR.CODCOR,'' '') ||'' ''|| RTRIM(AR.CODTAMANHO),PV.DESCPRODVARI),1,60) AS PRODUTO, ');
               Sql.Add('     IT.QTDERECEBDEVOL, ');
               Sql.Add('     IT.VLRUNITARIO, ');
               Sql.Add('     IT.CODMEDIDA, ');
               Sql.Add('     IT.QTDERECEBDEVOL*IT.VLRUNITARIO AS VALORTOTAL, ');
               Sql.Add('     (IT.VLRESTOQUE - (IT.QTDERECEBDEVOL*IT.VLRUNITARIO)) AS ACDES , ');
               Sql.Add('     ((IT.QTDERECEBDEVOL*IT.VLRUNITARIO)+(IT.QTDERECEBDEVOL*IT.VLRUNITARIO- IT.VLRESTOQUE )) as ValPag,');
               Sql.Add('     IT.VLRESTOQUE,        ');
               Sql.Add('     IT.IDITENSRECDEV,     ');
               Sql.Add('     NF.VLRNOTAFISCAL,     ');
               Case RgTipo.ItemIndex Of
                  0 : Sql.Add('DECODE(NF.CODDOCUMENTO,NULL,''NÃO INTEGRADA'',TD.DESCRICAO) AS TIPODOC, ');
                  1 : Sql.Add('     TD.DESCRICAO AS TIPODOC, ');
                  2 : Sql.Add('(''NÃO INTEGRADA'') AS TIPODOC, ');
               End;
               Sql.Add('     TOT.TOTAL             ');
               Sql.Add(' FROM                      ');
               Sql.Add('     ALMOX AL,             ');
               Sql.Add('     ARTIGO AR,            ');
               Sql.Add('     PRODUTO PR,           ');
               Sql.Add('     ITENSRECEBDEVOL IT,   ');
               Sql.Add('     NFRECEBDEVOL NF,      ');
               Sql.Add('     PESSOA P,             ');
               Sql.Add('     PRODVARI PV,          ');
               If rgTipo.ItemIndex < 2 Then
               Begin
                  Sql.Add('     DOCUMENTO D,          ');
                  Sql.Add('     TIPODOCRECPAG TD,     ');
               End;
               Sql.Add('     ( SELECT              ');
               Sql.Add('             SUM(VLRNOTAFISCAL) AS TOTAL ');
               Sql.Add('        FROM ');
               Sql.Add('             NFRECEBDEVOL ');
               Sql.Add('        WHERE ');
               Sql.Add('               (IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')');
               Sql.Add('           AND (FLGTIPONOTA = ''R'') ');

                                   if (cmpForn.Text <> '') then //foi selecionado um fornecedor
                                      sql.Add('AND (IDFORCLI = ' + IntToStr(cmpForn.ForCliReg.Id)  + ')');

               Sql.Add('           AND (DATAENTDEVOL >= TO_DATE('''+deDataInicial.Text+''',''DD/MM/YYYY''))');
               Sql.Add('           AND (DATAENTDEVOL <= TO_DATE('''+deDataFinal.Text+''',''DD/MM/YYYY'')) ) TOT ');
               Sql.Add(' WHERE ');
               Sql.Add('       (NF.IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')');
               Sql.Add('   AND (NF.DATAENTDEVOL >= TO_DATE('''+deDataInicial.Text+''',''DD/MM/YYYY''))');
               Sql.Add('   AND (NF.DATAENTDEVOL <= TO_DATE('''+deDataFinal.Text+''',''DD/MM/YYYY''))');
            if Trim(dblkcmbAlmox.text ) <> '' then
               Sql.add('   AND (AL.CODALMOXARIFADO = '+dblkcmbAlmox.LookupValue+')');
            if Trim(cmpForn.text ) <> '' then
               Sql.add('   AND (NF.IDFORCLI = '+IntToStr(cmpForn.ForCliReg.Id)+')');

               Sql.Add('   AND (NF.FLGTIPONOTA = ''R'')                 ');
               Sql.Add('   AND (NF.IDFORCLI = P.IDPESSOA)               ');
               Case RgTipo.ItemIndex of
                   0:Begin
                        Sql.Add('   AND (NF.CODDOCUMENTO = D.CODDOCUMENTO(+))    ');
                        Sql.Add('   AND (D.CODTIPDOC = TD.CODTIPDOC(+))          ');
                     End;
                   1:Begin
                        Sql.Add('   AND (NF.CODDOCUMENTO = D.CODDOCUMENTO)    ');
                        Sql.Add('   AND (D.CODTIPDOC = TD.CODTIPDOC)          ');
                     End;
                   2:Begin
                        Sql.Add('   AND (NF.CODDOCUMENTO IS NULL)    ');
                     End;

               End;
            If chkEstoque.Checked Then
               Sql.Add('   AND (PR.ITEMESTOCAVEL = ''S'')');

               Sql.Add('   AND (IT.FLGDESTINO IN ('+sDestino+')  )');
               Sql.Add('   AND (IT.IDNFRECEBDEVOL = NF.IDNFRECEBDEVOL)  ');
               Sql.Add('   AND (IT.CODALMOXARIFADO = AL.CODALMOXARIFADO)');
               Sql.Add('   AND (IT.CODARTIGO = AR.CODARTIGO)            ');
               Sql.Add('   AND (AR.CODPRODUTO = PR.CODPRODUTO)          ');
               Sql.Add('   AND (PV.IDPRODVARI(+) = IT.IDPRODVARI)       ');
               Case rgOrdem.ItemIndex Of
                  0 : Sql.Add(' ORDER BY DATAEMISNF, FORNECEDOR, NF.NUMNF,IT.IDITENSRECDEV ');
                  1 : Sql.Add(' ORDER BY DATAEMISNF, NF.NUMNF,FORNECEDOR ,IT.IDITENSRECDEV ');
               End;
             Open;
          End;
         dtmRelatoriosAlmox.lbDataRecebimento.caption := deDataInicial.Text+ ' à ' + deDataFinal.Text;
     End;
end;

procedure TfrmParamRecebimento.FormActivate(Sender: TObject);
begin
  inherited;
  deDataInicial.Text := DateToStr(Date);
  deDataFinal.Text   := DateToStr(Date);
//
  qryAlmox.Close;
  qryAlmox.SQL.Text:= ' SELECT CODALMOXARIFADO, DESCALMOX FROM ALMOX WHERE (IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')' +
                      ' ORDER BY DESCALMOX ';
  qryAlmox.Open;
//
end;

end.
