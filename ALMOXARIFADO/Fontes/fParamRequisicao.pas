// Atualizado por : andré tavares - 21/01/2004 - pendência 15602


unit fParamRequisicao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
   Db, DBTables, Wwquery, IvDictio, IvMulti, IvEMulti, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmParamRequisicao = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    deDataInicial: TCMDateTimePicker;
    deDataFinal: TCMDateTimePicker;
    Label4: TLabel;
    dblkcmbAlmox: TwwDBLookupCombo;
    Label5: TLabel;
    qryAlmox: TwwQuery;
    RgOrdem: TRadioGroup;
    qryCCust: TwwQuery;
    Label6: TLabel;
    dblcCCust: TwwDBLookupCombo;
    RgTipo: TRadioGroup;
    edNumReq: TEdit;
    chkEstoque: TCheckBox;
    DBLKitem: TwwDBLookupCombo;
    Label7: TLabel;
    qryItem: TwwQuery;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Procedure FazRel;
  public
    { Public declarations }
  end;

var
  frmParamRequisicao: TfrmParamRequisicao;

implementation

uses DRelatoriosAlmox, usistema, uString;

{$R *.DFM}


Procedure TfrmParamRequisicao.FazRel;
Begin
  inherited;
  dtmRelatoriosAlmox.LbTipo.Caption := RgTipo.Items.Strings[RgTipo.ItemIndex];
  dtmRelatoriosAlmox.lbData.caption := deDataInicial.Text+' a '+deDataFinal.Text;
  With DtmRelatoriosAlmox.qryRequisicao Do
     Begin
          Close;
          Sql.Clear;
          Sql.add(' SELECT                                                                    ');
          Sql.add('   AL.DESCALMOX AS ALMOXARIFADO,                                           ');
          Sql.Add('   SL.LOCALIZACAO,                                                         ');
          Sql.add('   M.NUMDOCUMENTO AS NUMERO,                                               ');
          Sql.add('   M.IDMOV,                                                                ');
          Sql.add('   M.DATAMOV,                                                              ');
          Sql.add('   M.CODCENTROCUSTO,                                                       ');
          Sql.add('   M.CODARTIGO,                                                            ');
          Sql.add('   PR.CODMEDCUSTO,                                                         ');
          Sql.add('   PR.DESCPROD || '' '' || A.CODCOR || '' '' || A.CODTAMANHO AS DESCRICAO, ');
          Sql.add('   (M.QTDEMOV*(-1))  AS QTDEMOV,                                           ');
          Sql.add('   (M.VALORMOV*(-1)) AS VALORMOV,                                          ');
          Sql.add('   M.CUSTOMEDIOMOV,                                                        ');
          Sql.add('   M.CODTIPOMOV,                                                           ');
          Sql.add('   C.NOME,                                                                 ');
          Sql.add('   M.NUMDOCUMENTO||M.CODCENTROCUSTO AS GRUPO                               ');
          Sql.add(' FROM             ');
          Sql.add('    MOVIMENT M,   ');
          Sql.Add('    SALDO sl,     ');
          Sql.add('    PRODUTO PR,   ');
          Sql.add('    ARTIGO A,     ');
          Sql.add('    ALMOX AL,     ');
          Sql.add('    CENTCUST C    ');
          Sql.add(' WHERE  (1=1)     ');

        If Trim(edNumReq.text ) <> '' Then
            Sql.add(' AND (RTRIM(M.NUMDOCUMENTO) = '''+Trim(edNumReq.Text)+''')' )
        Else
          Begin
              Case RgTipo.ItemIndex Of
                 0 : Sql.add(' AND (M.CODTIPOMOV <> ''Z'') AND (M.CODTIPOMOV <> ''A'') AND (M.CODTIPOMOV <> ''K'') AND (M.CODTIPOMOV <> ''B'') ');
                 1 : Sql.add(' AND ((M.CODTIPOMOV = ''E'') OR (M.CODTIPOMOV = ''P'')) ');
                 2 : Sql.add(' AND (M.CODTIPOMOV = ''I'') ');
                 3 : Sql.add(' AND (M.CODTIPOMOV IN (''F'',''T'',''G'',''U'',''R'',''S''))');
              End;
              Sql.add('   AND (M.DATAMOV >= TO_DATE('''+DateToStr(deDataInicial.Date)+''',''DD/MM/YYYY'')) ');
              Sql.add('   AND (M.DATAMOV <= TO_DATE('''+DateToStr(deDataFinal.Date)+''',''DD/MM/YYYY''))   ');
              If Trim(dblkcmbAlmox.text ) <> '' Then
                  Sql.add(' AND (M.CODALMOXARIFADO = ' +Trim(dblkcmbAlmox.LookupValue)+')' );
              If Trim(dblcCCust.text ) <> '' Then
                  Sql.add(' AND (RTRIM(M.CODCENTROCUSTO) = '''+Trim(dblcCCust.LookupValue)+''')' );
          End;

        If chkEstoque.Checked Then
           Sql.Add('   AND (PR.ITEMESTOCAVEL = ''S'')');

        Sql.add(' AND (M.IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+') ');
        Sql.add(' AND (C.IDEMPRESA = '+IntToStr(Sistema.IdEmpresa)+')');

        Sql.add(' AND (A.CODARTIGO = M.CODARTIGO)                    ');

       if (trim(DblkItem.text) <> '') and (trim(DblkItem.LookupValue) <> '') then
         Sql.add(' AND (PR.CODPRODUTO = '+ quotedStr(DblkItem.LookupValue) +') ');

        Sql.add(' AND (A.CODPRODUTO = PR.CODPRODUTO)                 ');
        Sql.add(' AND (M.CODALMOXARIFADO = AL.CODALMOXARIFADO )      ');
        Sql.add(' AND (M.CODCENTROCUSTO = C.CODCENTROCUSTO )         ');
        Sql.Add(' AND (A.CODARTIGO(+)       = SL.CODARTIGO )         ');
        Sql.Add(' AND (AL.CODALMOXARIFADO(+)= SL.CODALMOXARIFADO )   ');

        Case RgOrdem.ItemIndex Of
          0 : Sql.Add('ORDER BY ALMOXARIFADO, M.DATAMOV, NUMERO, M.CODCENTROCUSTO, DESCRICAO ');
          1 : Sql.Add('ORDER BY ALMOXARIFADO, M.DATAMOV, NUMERO, M.CODCENTROCUSTO, M.IDMOV ');
        End;
        Open;
     End;
End;

procedure TfrmParamRequisicao.bbtnConfirmarClick(Sender: TObject);
begin
   ModalResult := mrOk;
   FazRel;
end;

procedure TfrmParamRequisicao.FormCreate(Sender: TObject);
begin
  inherited;
  deDataInicial.Date := Date;
  deDataFinal.Date   := Date;
  //
  qryCCust.Close;
  qryCCust.Sql.text := ' Select CodCentroCusto,Nome From CentCust ' +
                       ' Where (idEmpresa = '+ IntToStr(Sistema.IdEmpresa ) +')'+
                       ' Order By Nome ';
  qryCCust.Open;
  //
  qryAlmox.Close;
  qryAlmox.SQL.Text:= ' SELECT CODALMOXARIFADO, DESCALMOX FROM ALMOX WHERE IDPESSOA = ' +IntToStr(Sistema.IdEmpresa) +
                      ' ORDER BY DESCALMOX ';
  qryAlmox.Open;

  qryItem.Close;
  qryItem.Open;
end;

end.
