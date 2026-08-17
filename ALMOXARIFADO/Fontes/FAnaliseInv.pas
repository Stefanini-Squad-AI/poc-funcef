unit FAnaliseInv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Grids,
  Wwdbigrd, Wwdbgrid, MontaSelect, Db, Wwdatsrc, DBTables, Wwquery,
  IvDictio, IvMulti, IvEMulti, wwdblook;

type
  TfrmAnaliseInv = class(TfrmSairAjuda)
    qry: TwwQuery;
    dsGrid: TwwDataSource;
    qryAux: TwwQuery;
    MontaSelect: TMontaSelect;
    dbgrdArtigos: TwwDBGrid;
    bbtnAtualizaSaldo: TBitBtn;
    qryContagem: TwwQuery;
    qryInventario: TwwQuery;
    qryAux1: TwwQuery;
    ToolbarSep971: TToolbarSep97;
    qryUnidNegoc: TwwQuery;
    Panel1: TPanel;
    Label1: TLabel;
    edAlmoxa: TEdit;
    Label3: TLabel;
    dblcAtiv: TwwDBLookupCombo;
    sbSelecionaInv: TSpeedButton;
    qryDESCRICAO: TStringField;
    qryCUSTOMEDIO: TFloatField;
    qrySALDOINICIAL: TFloatField;
    qryQTDECONTADA: TFloatField;
    qryDIFERENCAATUAL: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure sbSelecionaInvClick(Sender: TObject);
    procedure AnalisaInv;
    procedure bbtnAtualizaSaldoClick(Sender: TObject);
    procedure AtualizaSaldo;
  private
    { Private declarations }
    procedure FazerQryPrincipal;
  public
    { Public declarations }
  end;

var
  frmAnaliseInv: TfrmAnaliseInv;
  iInventario:LongInt;
  bContagemOK:Boolean;
  sSql:String;
implementation

{$R *.DFM}
uses UConversaoMed, UMensErro, UFuncaoGeral, USistema, uString,uModulo,uDataBase,
     FAguarde,UMovNew, DBaseDados, FTelaAut, UAutorizacao;

procedure TfrmAnaliseInv.FormCreate(Sender: TObject);
begin
  inherited;
  try
     bbtnAtualizaSaldo.Enabled := False;
     edAlmoxa.Text             := Modulo.sAlmoxaUsuario;
     //
     qryUnidNegoc.Close;
     qryUnidNegoc.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
     qryUnidNegoc.Open;
     //
     iInventario := 0;
     //
     MontaSelect.Filtro.Add('INVENTAR.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
     MontaSelect.Filtro.Add('INVENTAR.CODALMOXARIFADO = '+IntToStr(Modulo.iCodAlmoxa));
     MontaSelect.Filtro.Add('INVENTAR.CONTAGEMENCERRADA <> ''T''');
     //
     FazerQryPrincipal;
     //
  except
     Raise;
     Exit;
  end;
end;
//
procedure TfrmAnaliseInv.FazerQryPrincipal;
Begin

     qry.Close;
     qry.Sql.Text:=''+
          ' SELECT (P.DESCPROD || '' '' || A.CODTAMANHO || '' '' || A.CODCOR) AS DESCRICAO, '+
          '         CM.CUSTOMEDIO, RC.SALDOINICIAL, '+
          '         RC.QTDECONTADA, RC.DIFERENCAATUAL '+
          ' FROM  ARTIGO A,  '+
          '      PRODUTO P, '+
          '      SALDO S,   '+
          '      CUSTOMED CM, '+
          '      RESCONT RC '+
          ' WHERE '+
          '     (S.CODALMOXARIFADO(+) = ' + intToStr(Modulo.iCodAlmoxa)+')'+
          ' AND (CM.CODCUSTEIO(+) = ' + intToStr(Modulo.iCodCusteio)+')'+
          ' AND (RC.IDINVENTARIO = '+IntToStr(iInventario)+')'+
          ' AND (S.SALDOQTDE <> RC.QTDECONTADA) '+
          ' AND (P.CODPRODUTO = A.CODPRODUTO) '+
          ' AND (A.CODARTIGO = S.CODARTIGO(+)) '+
          ' AND (A.CODARTIGO = CM.CODARTIGO(+)) '+
          ' AND (A.CODARTIGO = RC.CODARTIGO) '+
          ' ORDER BY DESCRICAO';
     qry.Open;
end;
//
procedure TfrmAnaliseInv.sbSelecionaInvClick(Sender: TObject);
begin
  inherited;
  MontaSelect.Executar;
  if MontaSelect.RetornouValor then
  begin
     iInventario := StrToInt(MontaSelect.ValoresChave[0]);
     //
     qryInventario.Close;
     qryInventario.SQL.text := 'SELECT * FROM INVENTAR WHERE IDINVENTARIO = '+IntToStr(iInventario);
     qryInventario.Open;
     //
     bContagemOK := True;
     AnalisaInv;
     if bContagemOK = True then
     Begin
        FazerQryPrincipal;
        bbtnAtualizaSaldo.Enabled := True;
        Self.AutorizarForm(afSoDesabilitar);
     end;
  end
  else
     bbtnAtualizaSaldo.Enabled := False;
end;

procedure TfrmAnaliseInv.AnalisaInv;
var rDiferenca,rQtdeConvertida,rQtdeContada:Real;
    scSql,sDiferenca,sQtdeContada:String;
Begin
    //
    bContagemOK:=True;
    //
    qryContagem.Close;
    qryContagem.SQL.text := 'SELECT CODARTIGO,CODMEDIDA,QTDECONTADA FROM QTDECONT WHERE (IDINVENTARIO = '+IntToStr(iInventario)+')'+
                            ' AND (QTDECONTADA IS NOT NULL)';
    qryContagem.Open;
    //
    if qryContagem.IsEmpty Then
    Begin
      MsgDlg('Contagem deste inventário não foi Efetuada. Não existe análise a ser feita.', 'Erro', mtError, [mbOk, mbHelp], 0);
      FuncaoGeral.TiraIcone;
      bContagemOK:=False;
      exit;
    end;
    Try
       StartTransacao;
       with qryAux do begin
          Close;
          Sql.Clear;
          Sql.Add('DELETE RESCONT WHERE (IDINVENTARIO = '+InttoStr(iInventario)+')');
          ExecSQL;
       end;
       with qryAux do begin
          Close;
          scSql:='';
          scSql:=scSql+'(SELECT I.IDINVENTARIO,S.CODARTIGO,DECODE(S.SALDOQTDE,NULL,0,S.SALDOQTDE) FROM INVENTAR I, SALDO S, GRUPPROD G, PRODUTO P, ARTIGO A ';
          scSql:=scSql+' WHERE (I.IDINVENTARIO = '+IntToStr(iInventario)+') AND ';
          if not qryInventario.FieldByName('CODGRUPOPROD').IsNull then
             scSql:=scSql+'(G.CODGRUPOPROD LIKE '''+trim(qryInventario.FieldByName('CODGRUPOPROD').AsString)+'%'') AND ';
          scSql:=scSql+' (G.CODGRUPOPROD = P.CODGRUPOPROD) AND ';
          scSql:=scSql+' (P.CODPRODUTO = A.CODPRODUTO) AND ';
          scSql:=scSql+' (A.CODARTIGO = S.CODARTIGO) AND ';
          scSql:=scSql+' (I.CODALMOXARIFADO = S.CODALMOXARIFADO))';
          //
          sSql :='INSERT INTO RESCONT(IDINVENTARIO,CODARTIGO,SALDOINICIAL) '+scSql;
          Sql.Clear;
          Sql.Add(sSql);
          ExecSQL;
       end;
       qryContagem.First;
       While not qryContagem.EOF do
       Begin
          //
          qryAux.Close;
          qryAux.SQL.text := 'SELECT RC.SALDOINICIAL,RC.CODARTIGO,RC.QTDECONTADA,P.CODMEDCUSTO FROM RESCONT RC,  PRODUTO P WHERE (RC.IDINVENTARIO = '+IntToStr(iInventario)+')'+
                             ' AND (RTRIM(RC.CODARTIGO) = '''+qryContagem.FieldByName('CODARTIGO').AsString+''') AND ( SUBSTR(RC.CODARTIGO,1,6) = P.CODPRODUTO )';
          qryAux.Open;
          if QryAux.IsEmpty then
            Begin
               MsgDlg('O ARTIGO CÓDIGO : '+qryContagem.FieldByName('CODARTIGO').AsString+' não foi encontrado na Tabela RESCONT','Erro',mtError,[mbOk],0);
               Abort;
            end;
          //
          rQtdeConvertida:=ConversaoMed.ConverteSaldoQtde(qryContagem.FieldByName('CODARTIGO').AsString,
                           qryContagem.FieldByName('CODMEDIDA').AsString,qryAux.FieldByName('CODMEDCUSTO').AsString,
                           qryContagem.FieldByName('QTDECONTADA').AsFloat);
          rQtdeContada:=qryAux.FieldByName('QTDECONTADA').AsFloat+rQtdeConvertida;
          sQtdeContada:=FuncaoGeral.OraNumero(rQtdeContada);
          rDiferenca  :=rQtdeContada-qryAux.FieldByName('SALDOINICIAL').AsFloat;
          sDiferenca  :=FuncaoGeral.OraNumero(rDiferenca);
          with qryAux do begin
             Close;
             sSql :='UPDATE RESCONT SET QTDECONTADA = '+sQtdeContada+
                    ', DIFERENCAATUAL = '+sDiferenca+
                    ' WHERE (IDINVENTARIO = '+InttoStr(iInventario)+')'+
                    ' AND (CODARTIGO = '''+qryContagem.FieldByName('CODARTIGO').AsString+''')';
             Sql.Clear;
             Sql.Add(sSql);
             ExecSQL;
          end;
          qryContagem.Next;
       end;
       with qryAux do begin
          Close;
          sSql :='DELETE RESCONT WHERE (IDINVENTARIO = '+InttoStr(iInventario)+')'+
                 ' AND (QTDECONTADA IS NULL)';
          Sql.Clear;
          Sql.Add(sSql);
          ExecSQL;
       end;
       CommitTransacao;
    Except
       RollBackTransacao;
       MsgDlg('Analise das Diferenças não Efetuada','Erro',mtError,[mbOk],0);
       bContagemOK:=False;
       FuncaoGeral.TiraIcone;
       Raise;
    end;
end;

procedure TfrmAnaliseInv.bbtnAtualizaSaldoClick(Sender: TObject);
begin
  inherited;
  If (trim(dblcAtiv.Text) = '') Then
     Begin
        MsgDlg('Atividade/Projeto não foi preenchido','Erro',mtError,[mbOk],0);
        dblcAtiv.SetFocus;
        Exit;
     End;
  bbtnAtualizaSaldo.Enabled:=False;
  MsgDlg('Este procedimento atualizará o saldo do almoxarifado pela contagem física','Aviso',mtWarning,[mbOk],0);
  FuncaoGeral.TiraIcone;
  if (MsgDlg('Confirma a Atualização','Aviso',mtConfirmation,[mbOk,mbCancel],0)) = mrOK then
  Begin
     Try
        StartTransacao;
        AtualizaSaldo;
        CommitTransacao;
        MsgDlg('Atualização de Saldo efetuada com Sucesso','Aviso',mtWarning,[mbOk],0);
        FuncaoGeral.TiraIcone;
        bbtnSair.Click;
     Except
        RollBackTransacao;
        MsgDlg('Atualização de Saldo não efetuada','Erro',mtError,[mbOk],0);
        FuncaoGeral.TiraIcone;
        bbtnAtualizaSaldo.Enabled := True;
     end;
  end
  else
     bbtnAtualizaSaldo.Enabled := True;
end;

procedure TfrmAnaliseInv.AtualizaSaldo;
var idMov         : LongInt;
    dtData        : TDateTime;
begin
  // ATUALIZA MOVIMENTO
   with qryAux do begin
      Close;
      Sql.Clear;
      sSql := 'Select I.IdInventario,I.DataInventario,R.CodArtigo, '+
              ' R.DiferencaAtual,P.CodMedCusto '+
              ' From ResCont R, Inventar I,Artigo A, Produto P'+
              ' Where (I.IdInventario = ' + IntToStr(iInventario)+')'+
              ' and (I.IdInventario = R.IdInventario)'+
              ' and (R.DiferencaAtual is not NULL)'+
              ' and (R.DiferencaAtual != 0)'+
              ' and (R.CodArtigo = A.CodArtigo)'+
              ' and (A.CodProduto = P.CodProduto)';
       Sql.Add(sSql);
       Open;
       dtData := FieldByName('DataInventario').asDateTime;
       First;
       while not EOF do
       begin
          idMov:=0;
          if FieldByname('DiferencaAtual').AsFloat > 0 then
          {Diferença positiva => Almoxarifado < Contagem}
          { CodTipoMov = D = Ajuste no estoque por SOBRA }
               idMov := MovNew.GeraMov ('S',
                                        0,
                                       ((FieldByName('DiferencaAtual').AsFloat)*-1),
                                        Modulo.iCodCusteio,
                                        Modulo.iCodAlmoxa,
                                        FieldByName('CodArtigo').AsString,
                                        '',
                                        'D',
                                        FieldByName('CodMedCusto').AsString,
                                        FieldByName('DataInventario').AsString,
                                        FieldByName('DataInventario').AsString,
                                        FieldByName('IdInventario').AsString,
                                        Modulo.sCCustoAlmoxa,
                                        Sistema.IdEmpresa,-1,
                                        strToInt(dblcAtiv.LookUpValue))
          else if FieldByname('DiferencaAtual').AsFloat < 0 then
                 {Diferença negativa => Almoxarifado > Contagem}
                 { CodTipoMov = H = Baixa no estoque por PERDA }
               idMov := MovNew.GeraMov ('S',
                                        0,
                                        Abs(FieldByName('DiferencaAtual').AsFloat),
                                        Modulo.iCodCusteio,
                                        Modulo.iCodAlmoxa,
                                        FieldByName('CodArtigo').AsString,
                                        '',
                                        'H',
                                        FieldByName('CodMedCusto').AsString,
                                        FieldByName('DataInventario').AsString,
                                        FieldByName('DataInventario').AsString,
                                        FieldByName('IdInventario').AsString,
                                        Modulo.sCCustoAlmoxa,
                                        Sistema.IdEmpresa,-1,
                                        strToInt(dblcAtiv.LookUpValue));
          if idMov = - 1 then
             Abort;
          //
          qryAux1.Close;
          qryAux1.SQL.Text:='UPDATE RESCONT SET IDMOV = '+IntToStr(idMov)+
                            ' WHERE (IDINVENTARIO = '+ IntToStr(iInventario)+')'+
                            ' AND (CODARTIGO = '''+FieldByName('CodArtigo').AsString+''')';
          qryAux1.ExecSQL;
          Next;
       end;
   end; //with
   //Atualiza INVENTAR
   with qryAux do begin
      Close;
      sSql :='UPDATE INVENTAR SET DATATRAVA = NULL, CONTAGEMENCERRADA = ''T'''+
             ' WHERE (IDINVENTARIO = '+InttoStr(iInventario)+')';
      Sql.Clear;
      Sql.Add(sSql);
      ExecSQL;
   // Atualzia data do Ultimo Inventério
   If FazQuery(DtmBaseDados.qry,' SELECT DATAULTINVENTARIO '+
                                ' FROM UNCUSTEI '+
                                ' WHERE (IDPESSOA = '+IntToStr( Sistema.idEmpresa )+') '+
                                '   AND (CODCUSTEIO = '+IntToStr(Modulo.leUnCusteio( Modulo.icodAlmoxa ))+') ')
   Then
     Begin
         If dtData > DtmBaseDados.qry.FieldByName('DATAULTINVENTARIO').asDateTime Then
            ExecutarQuery(DtmBaseDados.qry, ' UPDATE UNCUSTEI SET'+
                                            ' DATAULTINVENTARIO = To_Date('''+DateToStr( dtData )+''',''DD/MM/YYYY'') '+
                                            ' WHERE (IDPESSOA = '+IntToStr( Sistema.idEmpresa )+') '+
                                            '   AND (CODCUSTEIO = '+IntToStr(Modulo.leUnCusteio( Modulo.icodAlmoxa ))+') ');
     End;
   end;
end;

end.
