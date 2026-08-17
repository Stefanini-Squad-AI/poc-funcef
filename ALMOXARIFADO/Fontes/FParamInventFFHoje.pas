unit FParamInventFFHoje;

interface

uses                                                          
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBTables, Wwquery,
  wwdbdatetimepicker, CMDateTimePicker ;

type
  TFrmParamInventFFHoje = class(TfrmOkCancelar)
    qryAlmox: TwwQuery;
    qryGrpProd: TwwQuery;
    Label3: TLabel;
    dblcAlmox: TwwDBLookupCombo;
    Label5: TLabel;
    dblcGrpProd: TwwDBLookupCombo;
    RgOrdem: TRadioGroup;
    chkimp: TCheckBox;
    Label1: TLabel;
    edData: TCMDateTimePicker;
    qryAux: TwwQuery;
    chkEstoque: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure FazerQry;
  public
    { Public declarations }
  end;

var
  FrmParamInventFFHoje: TFrmParamInventFFHoje;

implementation

{$R *.DFM}
uses DRptRelats, uMensErro, uModulo, uSistema;

Procedure TFrmParamInventFFHoje.FazerQry;
var
    X           : Integer;
begin
   x:= Pos('.',Modulo.sMascaraGrupoProd)-1;
   With DtmRptRelats.QryInventFFHoje DO
     Begin
         Close;
         Sql.Text :=  ' SELECT '+
                      '      UN.CodGrupoProd, '+
                      '      UN.DescGrupoProd, '+
                      '      UN.StatusGrupo, '+
                      '      UN.CODARTIGO, '+
                      '      UN.DESCPROD, '+
                      '      UN.CodMedCusto, '+
                      '      UN.QTDE '+
                      'FROM '+
                      '( '+
                      ' SELECT '+
                      '      P.CodGrupoProd,  '+
                      '      G.DescGrupoProd, '+
                      '      G.StatusGrupo, '+
                      '      MOV.CODARTIGO, '+
                      '      P.DESCPROD, '+
                      '      P.CodMedCusto, '+
                      '      MOV.SALDOQTDEMOV AS QTDE'+
                      ' FROM '+
                      '      Produto P,  '+
                      '      GrupProd G, '+
                      '      ( Select '+
                      '               M.idMov, '+
                      '               M.CodArtigo,    '+
                      '               M.SALDOQTDEMOV, '+
                      '               M.CODALMOXARIFADO, '+
                      '               M.IDPESSOA '+
                      '         From '+
                      '              Moviment M, '+
                      '              ( Select '+
                      '                      M.CodArtigo, '+
                      '                      Max(M.idMov) as idMov '+
                      '                 From '+
                      '                      Moviment M, '+
                      '                     (SELECT '+
                      '                           CODARTIGO, '+
                      '                           MAX(DATAMOV) AS MAXDATAMOV '+
                      '                      FROM MOVIMENT '+
                      '                      WHERE  ( DATAMOV <= TO_DATE('''+EdData.Text+''',''DD/MM/YYYY'') )'+
                      '                         AND (CODALMOXARIFADO  = '+dblcAlmox.lookUpValue+')'+
                      '                      GROUP BY CODARTIGO '+
                      '                     ) SUB '+
                      '                Where (M.CODARTIGO = SUB.CODARTIGO)'+
                      '                  AND (M.DATAMOV =SUB.MAXDATAMOV) '+
                      '                  And (M.CodAlmoxarifado ='+ dblcAlmox.lookUpValue +') '+
                      '                Group By M.CodArtigo ) Aux '+
                      '         Where '+
                      '              (M.CodArtigo = Aux.CodArtigo) '+
                      '          And (M.CodAlmoxarifado ='+ dblcAlmox.lookUpValue +') '+
                      '          And (M.IdMov = Aux.IdMov) ) Mov '+
                      ' WHERE '+
                      '         (MOV.CodAlmoxarifado = '+ dblcAlmox.lookUpValue +') '+
                      '     And (MOV.idPessoa = '+ IntToStr(Sistema.IdEmpresa) +') ';
              if Not chkimp.Checked Then
              sql.add('     And (MOV.SALDOQTDEMOV <> 0)');
              if  chkEstoque.Checked Then
                 Sql.Add('  AND (P.ITEMESTOCAVEL = ''S'')');
              sql.add('     And (Substr(MOV.CodArtigo,1,6) = P.CodProduto)' +
                      '     And (G.CodGrupoProd = P.CodGrupoProd) '+
                      ' UNION '+
                      '  SELECT '+
                      '        G.CodGrupoProd, '+
                      '        G.DescGrupoProd, '+
                      '        G.StatusGrupo, '+
                      '        ('''') AS CODARTIGO, '+
                      '        ('''') AS DESCPROD, '+
                      '        ('''') AS CodMedCusto, '+
                      '        (0) AS QTDE '+
                      '   FROM '+
                      '        Produto P, '+
                      '        GrupProd G, '+
                      '        ( Select '+
                      '               M.idMov, '+
                      '               M.CodArtigo, '+
                      '               M.CODALMOXARIFADO,  '+
                      '               M.IDPESSOA '+
                      '          From '+
                      '               Moviment M, '+
                      '               ( Select '+
                      '                      M.CodArtigo, '+
                      '                      Max(M.idMov) as idMov '+
                      '                 From '+
                      '                      Moviment M, '+
                      '                      ( SELECT '+
                      '                             CODARTIGO, '+
                      '                             MAX(DATAMOV) AS MAXDATAMOV '+
                      '                        FROM MOVIMENT '+
                      '                        WHERE   ( DATAMOV <= TO_DATE('''+EdData.Text+''',''DD/MM/YYYY'') )'+
                      '                         AND (CODALMOXARIFADO  = '+dblcAlmox.lookUpValue+')'+
                      '                        GROUP BY CODARTIGO '+
                      '                       ) SUB '+
                      '                 Where (M.CODARTIGO = SUB.CODARTIGO) '+
                      '                   AND (M.DATAMOV =SUB.MAXDATAMOV) '+
                      '                   And (M.CodAlmoxarifado ='+ dblcAlmox.lookUpValue +') '+
                      '                 Group By M.CodArtigo '+
                      '                ) Aux '+
                      '          WHERE '+
                      '               (M.CodArtigo = Aux.CodArtigo) '+
                      '           And (M.CodAlmoxarifado ='+ dblcAlmox.lookUpValue +') '+
                      '           And (M.IdMov = Aux.IdMov) '+
                      '        ) Mov '+
                      '   WHERE '+
                      '        (MOV.CodAlmoxarifado ='+ dblcAlmox.lookUpValue +') '+
                      '    And (MOV.idPessoa = '+ IntToStr(Sistema.IdEmpresa) +') ');
             if  chkEstoque.Checked Then
                Sql.Add('  AND (P.ITEMESTOCAVEL = ''S'')');
              sql.Add('    And (Substr(MOV.CodArtigo,1,6) = P.CodProduto) '+
                      '    AND (G.CODGRUPOPROD LIKE SUBSTR(RTRIM(P.CODGRUPOPROD),1,'+IntToStr( X )+') || ''%'') '+
                      '    AND (LENGTH(RTRIM(G.CODGRUPOPROD)) <= '+IntToStr( X )+') '+
                      '    And (G.STATUSGRUPO = ''S'') '+
                      '   GROUP BY   G.CodGrupoProd, '+
                      '              G.DescGrupoProd, '+
                      '              G.StatusGrupo ) UN ');
          If  Trim(dblcGrpProd.Text) <> ''  Then
             Begin
                sql.Add(' WHERE (RTRIM(UN.CodGrupoProd) LIKE '''+dblcGrpProd.LookUpValue+''' || ''%'' ) ');
                DtmRptRelats.lbFiltro4.Caption  := dblcGrpProd.LookupValue + ' - '+dblcGrpProd.Text;
             End;
          Case RgOrdem.ItemIndex Of
             0 : sql.Add(' Order By UN.CodGrupoProd, UN.DescProd  ');
             1 : sql.Add(' Order By UN.CodGrupoProd, UN.CODARTIGO ');
          End;
       Open;
    End;
    DtmRptRelats.lbAlmox11.Caption   := dblcAlmox.Text;
    DtmRptRelats.LbPer10.Caption     := 'em '+ edData.Text;
End;

procedure TFrmParamInventFFHoje.FormCreate(Sender: TObject);
begin
  inherited;
  qryAlmox.Close;
  qryAlmox.SQL.Text := 'SELECT CODALMOXARIFADO,DESCALMOX FROM ALMOX WHERE (IDPESSOA = '+IntToStr(Sistema.idEmpresa)+')';
  qryAlmox.Open;
  //
  qryGrpProd.Open;
  //
  edData.Date := Modulo.LeDataRepresa;

  edData.Date := Date;
end;

procedure TFrmParamInventFFHoje.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If trim(dblcAlmox.Text) = '' Then
    Begin
        MsgDlg('Almoxarifado não preenchido','Erro',mtError,[mbOk],0);
        dblcAlmox.SetFocus;
        ModalResult  := MrNone;
    End
  Else
  If trim(edData.Text) = '' Then
    Begin
        MsgDlg('Data limite não preenchido','Erro',mtError,[mbOk],0);
        edData.SetFocus;
        ModalResult  := MrNone;
    End
  Else
     Begin
        ModalResult  := MrOK;
        FazerQry;
     End;
end;

end.
